package com.hanacard.transitpay.travel.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanacard.transitpay.member.model.dto.GroupMember;
import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.travel.model.dto.*;
import com.hanacard.transitpay.travel.service.TravelService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
    public ResponseEntity<?> insertTravelPlans(@RequestBody Travel travelRequest) {
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
            travel.setGroupId(travelRequest.getGroupId());

            // Travel 서비스 호출
            travelService.insertTravelAndGetId(travel);

            return ResponseEntity.ok(travel);
        } catch (JsonProcessingException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("여행 장소 데이터 처리 중 오류가 발생");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("요청 처리 중에 오류가 발생");
        }
    }

    @PostMapping("/insertScheduleTotalAmount")
    public ResponseEntity<?> insertScheduleTotalAmount(@RequestBody Schedule schedule) {
        try {
            int travelId = travelService.selectSchedule(schedule.getGroupId(),schedule.getTravel_title());
            schedule.setTravelId(travelId);
            travelService.insertScheduleTotalAmount(schedule);
            return ResponseEntity.ok("여행 총 금액 저장 완료");
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
    @PostMapping("toggleLikeTraveling")
    public ResponseEntity<?> toggleLikeTraveling(@RequestParam Long itemId, @RequestParam boolean isLiked) {
        boolean updated = travelService.toggleLikeTraveling(itemId, isLiked);
        return ResponseEntity.ok(Map.of("updated", updated));
    }

    @PostMapping("/insertSchedule")
    public ResponseEntity<?> insertSchedule(@RequestBody Schedule schedule) {
        try {
            int travelId = travelService.selectSchedule(schedule.getGroupId(),schedule.getTravel_title());
            schedule.setTravelId(travelId);
            travelService.insertSchedule(schedule);
            return ResponseEntity.ok("일정이 성공적으로 추가되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("일정 추가 중 오류가 발생했습니다.");
        }
    }
    @PostMapping("/selectMygroupTravelList")
    public ResponseEntity<List<MyGroupTravelInfo>> selectMygroupTravelList(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member) session.getAttribute("member");
            List<MyGroupTravelInfo> travelInfoList = travelService.selectMygroupTravelList(member.getMember_id());
            session.setAttribute("travelInfoList",travelInfoList);
            return ResponseEntity.ok(travelInfoList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/selectMygroupSchedule")
    public ResponseEntity<List<Schedule>> selectMygroupSchedule(@RequestParam int travelId) {
        try {
            List<Schedule> schedule = travelService.selectMygroupSchedule(travelId);
            return ResponseEntity.ok(schedule);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/insertBookmarkTraveling")
    public ResponseEntity<String> toggleBookmarkTraveling(@RequestParam Long itemId,HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            travelService.insertBookmarkTraveling(itemId,member.getMember_id());
            return ResponseEntity.ok("찜 등록 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @GetMapping("/selectBookmarkTravelList")
    public ResponseEntity<List<TravelInfo>> selectBookmarkTravelList(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            List<TravelInfo> favoriteTravels = travelService.selectBookmarkTravelList(member.getMember_id());
            return ResponseEntity.ok(favoriteTravels);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/selectTravelNoti")
    public ResponseEntity<?> selectTravelNoti(HttpServletRequest request,@RequestBody Map<String, String> jsonData) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            String travelId = (String)jsonData.get("travelId");
            String groupId = (String)jsonData.get("groupId");
            List<MyGroupTravelInfo> travelNoti =travelService.selectTravelNoti(member.getMember_id(),Integer.parseInt(travelId),Integer.parseInt(groupId));
            session.setAttribute("travelNoti",travelNoti);
            return ResponseEntity.ok("여행 알림 조회 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @GetMapping("/selectNoti")
    public ResponseEntity<?> selectNoti(String groupId) {
        try {
            List<GroupMember> groupNoti =travelService.selectNoti(groupId);
            return ResponseEntity.ok(groupNoti);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    private static List<ChatMessage> chatHistory = new ArrayList<>();

    // 채팅 메시지 저장
    @PostMapping("/saveChat")
    public ResponseEntity<String> saveChat(@RequestBody ChatMessage chatMessage) {
        try {
            // 채팅 내용 저장
            chatHistory.add(chatMessage);
            return ResponseEntity.ok("채팅 내용 저장 완료");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("채팅 내용 저장 실패");
        }
    }

    // 채팅 내용 불러오기
    @GetMapping("/loadChat")
    public ResponseEntity<List<ChatMessage>> loadChat() {
        try {
            return ResponseEntity.ok(chatHistory);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @GetMapping("/selectNotificationTravel")
    public ResponseEntity<?> selectNotificationTravel(int travelId,HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            // 정산해야할 금액
            int sheduleAmount = travelService.selectSheduleAmount(travelId);
            // 정산한 데이터 조회
            Schedule notifHistoryAmount = travelService.selectNotificationHistoryTravel(travelId);
            int interest = sheduleAmount - notifHistoryAmount.getPrice();
            System.out.println(interest);
            session.setAttribute("interest",interest);
            //정산완료
            if(sheduleAmount == notifHistoryAmount.getPrice() + interest){
                List<GroupMember> complateBalanceAccounts = travelService.complateBalanceAccounts(notifHistoryAmount.getTravelId());

                return ResponseEntity.ok(complateBalanceAccounts);
            }
            return ResponseEntity.ok("fail");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @GetMapping("/selectMemberNotificationHistory")
    public ResponseEntity<?> selectMemberNotificationHistory(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            List<Schedule> selectMemberNotificationHistory = travelService.selectMemberNotificationHistory(member.getMember_id());
            return ResponseEntity.ok(selectMemberNotificationHistory);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @GetMapping("/completeCalculateTravel")
    public ResponseEntity<?> completeCalculateTravel(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            int groupCount = travelService.completeCalculateTravel(member.getMember_id());
            return ResponseEntity.ok(groupCount);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}


