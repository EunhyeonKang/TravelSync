package com.hanacard.transitpay.member.controller;

import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
public class MemberController {
    private final MemberService memberService;
    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("checkPhoneLogin")
    public String sendVerificationPhone(String phoneNumber) {
        String authenticationCode=memberService.sendAuthenticationCode(phoneNumber);
        return authenticationCode;
    }
    @ResponseBody
    @PostMapping("/selectOneMember")
    public ResponseEntity<String> selectOneMember(@RequestBody Map<String, String> requestData, HttpServletRequest request) {
        String phoneNumber = requestData.get("phoneNumber");
        HttpSession session = request.getSession();
        Member member = memberService.selectOneMember(phoneNumber);
        try {
            if (member != null) {
                session.setAttribute("member", member);
            }
            return ResponseEntity.ok("로그인 성공");
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 실패");
        }
    }

    @GetMapping(value="/logoutMember")
    public ModelAndView deleteMember(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session != null) {
            session.invalidate();
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "로그아웃 성공");
        mav.addObject("loc","/");
        mav.setViewName("/common/message");
        return mav;
    }
    @GetMapping(value = "/api/social/login/kakao", produces = MediaType.APPLICATION_JSON_VALUE)
    public void getKakaoUserInfo(String code) {
        String access_token = memberService.getKakaoToken(code);
        memberService.getKakaoUserInfo(access_token);
    }

    @GetMapping(value = "/groupShare")
    public void shareKakaoGroup(String code, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");
        memberService.shareKakaoGroup(code,member);

    }
}
