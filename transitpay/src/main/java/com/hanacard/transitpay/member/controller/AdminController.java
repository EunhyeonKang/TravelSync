package com.hanacard.transitpay.member.controller;

import com.hanacard.transitpay.member.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminController {
    private final AdminService adminService;
    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }


//    @PostMapping("/checkPhone")
//    @ResponseBody
//    public String checkPhone(@RequestBody Member member) {
//        // Member 객체에 요청 데이터가 매핑됩니다.
//        String phone = member.getPhone();
//        String groupName = member.getGroupName();
//        String authenticationCode=memberService.sendAuthenticationCode(phone,groupName);
//        return authenticationCode;
//    }

}
