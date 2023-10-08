package com.hanacard.transitpay.member.controller;

import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.member.model.dto.Search;
import com.hanacard.transitpay.member.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AdminController {
    private final AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @PostMapping("/selectMember")
    @ResponseBody
    public ResponseEntity<List<Member>> selectMember() {
        try {
            List<Member> member = adminService.selectMember();
            return ResponseEntity.ok(member);
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/searchLocation")
    @ResponseBody
    public ResponseEntity<List<Search>> searchLocation() {
        try {
            List<Search> searchResult = adminService.searchLocation();
            return ResponseEntity.ok(searchResult);
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/optionLocation")
    @ResponseBody
    public ResponseEntity<List<String>> optionLocation() {
        try {
            List<String> optionLocation = adminService.optionLocation();
            return ResponseEntity.ok(optionLocation);
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/searchLocationByDate")
    @ResponseBody
    public ResponseEntity<List<Search>> searchLocationByDate(String option) {
        try {
            List<Search> optionBydate = adminService.searchLocationByDate(option);
            System.out.println(optionBydate);
            return ResponseEntity.ok(optionBydate);
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/searchCount")
    @ResponseBody
    public ResponseEntity<Integer> searchCount() {
        try {
            int searchCount = adminService.searchCount();
            return ResponseEntity.ok(searchCount);
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(-1);
        }
    }

    @PostMapping("/recommendOfMember")
    @ResponseBody
    public ResponseEntity<List<Member>> recommendOfMember() {
        try {
            List<Member> recommend= adminService.recommendOfMember();
            return ResponseEntity.ok(recommend);
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}