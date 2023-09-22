package com.hanacard.transitpay.travel.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanacard.transitpay.member.model.dto.GroupMember;
import com.hanacard.transitpay.travel.model.dto.Schedule;
import com.hanacard.transitpay.travel.model.dto.ScheduleSet;
import com.hanacard.transitpay.travel.model.dto.Travel;
import com.hanacard.transitpay.travel.model.dto.TravelInfo;
import com.hanacard.transitpay.travel.service.TravelService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class TravelController {
    private final TravelService travelService;
    @Autowired
    public TravelController(TravelService travelService) {
        this.travelService = travelService;
    }

    @GetMapping("/searchResult")
    public ResponseEntity<List<TravelInfo>> handleSearchRequest( @RequestParam("searchText") String searchText,
                                                                  @RequestParam("travelPlaces") String travelPlaces) {
        List<TravelInfo> searchResult = travelService.handleSearchRequest(searchText,travelPlaces);
        return ResponseEntity.ok(searchResult);
    }


    @GetMapping("/getItemDetails")
    public ResponseEntity<TravelInfo> getItemDetails(@RequestParam int itemId) {
        // 여기에서 itemId를 사용하여 아이템을 조회하고 TravelInfo 객체를 반환
        TravelInfo itemDetails = travelService.getItemDetailsById(itemId);

        if (itemDetails != null) {
            return ResponseEntity.ok(itemDetails);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/placeSearch")
    public ResponseEntity<List<TravelInfo>> selectPlaceSearch(@RequestParam String searchText) {
        List<TravelInfo> placeList = travelService.selectPlaceSearch(searchText);
        return ResponseEntity.ok(placeList);
    }

    @PostMapping("/travelplans/map")
    public ResponseEntity<?> insertTravelPlans(@RequestBody Travel travelRequest, HttpServletRequest request) {
        HttpSession session = request.getSession();
        GroupMember groupMember = (GroupMember) session.getAttribute("groupMember");
        if (groupMember == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 존재하지 않음");
        }
        else {
            try {
                LocalDate startDate = LocalDate.parse(travelRequest.getTravelStart());
                LocalDate endDate = LocalDate.parse(travelRequest.getTravelEnd());
                int dDay = (int) ChronoUnit.DAYS.between(LocalDate.now(), startDate);
                int daysLeft = (int) ChronoUnit.DAYS.between(startDate, endDate);

                ObjectMapper objectMapper = new ObjectMapper();
                String travelPlaceJson = objectMapper.writeValueAsString(travelRequest.getTravelPlaceList());
                Travel travel = new Travel(); // Travel 객체 생성
                travel.setTravelTitle(travelRequest.getTravelTitle());
                travel.setTravelStart(travelRequest.getTravelStart());
                travel.setTravelEnd(travelRequest.getTravelEnd());
                travel.setTravelPlaceJson(travelPlaceJson);
                travel.setDaysLeft(daysLeft);
                travel.setDDay(dDay);
                travel.setMemberId(groupMember.getGroup_member_id());

                // Travel 서비스 호출
                travelService.insertTravelAndGetId(travel);

                return ResponseEntity.ok(travel);
            } catch (JsonProcessingException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("여행 장소 데이터 처리 중 오류가 발생");
            } catch (Exception e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("요청 처리 중에 오류가 발생");
            }
        }
    }

    @PostMapping("/travelplans/schedule")
    public ResponseEntity<?> insertScheduleSets(@RequestBody List<Schedule> scheduleList) {
        try {
            travelService.insertScheduleSets(scheduleList);
            return ResponseEntity.ok(scheduleList);
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("요청 처리 중에 오류가 발생");
        }
    }

    @GetMapping("/travelplans/traffic")
    public ResponseEntity<List<ScheduleSet>> handleTrafficData(@RequestParam String title) {
        List<ScheduleSet> schedule = travelService.handleTrafficData(title);
        return ResponseEntity.ok(schedule);
    }

    @GetMapping("/travelplans/naverTravelData")
    public ResponseEntity<List<TravelInfo>> naverTravelData(String selectedPlaceName) {
        // 크롤링
        String url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=" + selectedPlaceName;


        Document document = null;
        List<TravelInfo> travelMenuInfoList;
        try {
            document = Jsoup.connect(url).get();
            String menuLinks = document.select("#_title a").attr("href");
            // 정규 표현식 패턴
            Pattern pattern = Pattern.compile("/(\\d+)\\?");
            Matcher matcher = pattern.matcher(menuLinks);

            travelMenuInfoList = new ArrayList<>();
            if (matcher.find()) {
                String extractedValue = matcher.group(1);
                String menuListLink = "https://pcmap.place.naver.com/restaurant/" + extractedValue + "/menu/list";
                document = Jsoup.connect(menuListLink).get();
                Elements foodItems = document.select(".K0PDV, .lPzHi, .GXS1X");

                TravelInfo currentFood = null;
                for (Element item : foodItems) {
                    if (item.hasClass("lPzHi")) {
                        currentFood = new TravelInfo();
                        currentFood.setFoodName(item.text());
                    } else if (item.hasClass("GXS1X")) {
                        if (currentFood != null) {
                            currentFood.setFoodPrice(item.text());
                            travelMenuInfoList.add(currentFood);
                            currentFood = null;
                        }
                    }
                }

            } else {
                System.out.println("값을 추출할 수 없습니다.");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok(travelMenuInfoList);
    }

    @GetMapping("/selectTop3Travel")
    public ResponseEntity<?> selectTop3Travel() {
        try {
            List<TravelInfo> selectTop3TravelList =  travelService.selectTop3Travel();
            return ResponseEntity.ok(selectTop3TravelList);
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("요청 처리 중에 오류가 발생");
        }
    }

    @GetMapping("/selectCategoryTravel")
    public ResponseEntity<?> selectCategoryTravel(@RequestParam int page, @RequestParam int itemsPerPage, @RequestParam  String category) {
        System.out.println(page + " "+ itemsPerPage + " "+ category);
        try {
            List<TravelInfo> selectTravelList =  travelService.selectCategoryTravel(page,itemsPerPage,category);
            return ResponseEntity.ok(selectTravelList);
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("요청 처리 중에 오류가 발생");
        }
    }

    @PostMapping("/saveTravelInfo")
    public ResponseEntity<?> saveTravelInfo(@RequestBody List<TravelInfo> travelInfoList) {
        try {
            return ResponseEntity.ok("여행 정보가 성공적으로 저장되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("요청 처리 중에 오류가 발생");
        }
    }
    @GetMapping("selectAllTravel")
    public ResponseEntity<List<TravelInfo>> selectAllTravel(@RequestParam int page, @RequestParam int itemsPerPage) {
        try {
            List<TravelInfo> selectAllTravel =  travelService.selectAllTravel(page,itemsPerPage);
            return ResponseEntity.ok(selectAllTravel);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}


