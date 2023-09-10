package com.hanacard.transitpay.travel.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.travel.model.dto.Schedule;
import com.hanacard.transitpay.travel.model.dto.ScheduleSet;
import com.hanacard.transitpay.travel.model.dto.Travel;
import com.hanacard.transitpay.travel.model.dto.TravelInfo;
import com.hanacard.transitpay.travel.service.TravelService;
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
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

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
    public ResponseEntity<?> insertTravelPlans(@RequestBody Travel travelRequest,
                                          HttpServletRequest request) {
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");
        if (member == null) {
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
                travel.setMemberId(member.getMember_id());

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
}


