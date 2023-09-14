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
    @PostMapping("/insertKakaoAndPhoneMember")
    public ResponseEntity<String> insertKakaoAndPhoneMember(@RequestBody Member member, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            member.setJoin_date(member.getJoin_date().split("T")[0]);
            Member memberInfo = memberService.selectOneMember(member.getPhone());
            if (memberInfo != null) {
                session.setAttribute("member", memberInfo);
                return ResponseEntity.ok("로그인 성공");
            }else{
                memberService.insertKakaoAndPhoneMember(member);
                Member memberId = memberService.selectOneMember(member.getPhone());
                session.setAttribute("member", memberId);
                return ResponseEntity.ok("로그인 성공");
            }

        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 실패");
        }
    }

    @GetMapping(value="/logout")
    public ModelAndView deleteMember(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mav = new ModelAndView();
        if(session != null) {
            session.invalidate();
        }
        mav.addObject("msg", "로그아웃 성공");
        mav.addObject("loc","/");
        mav.setViewName("/common/message");
        return mav;
    }
    @GetMapping(value = "/api/social/login/kakao", produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView getKakaoUserInfo(String code,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        //토큰 생성 함수
        String access_token = memberService.getKakaoToken(code);
        //사용자 정보 조회 함수
        Member member = memberService.getKakaoUserInfo(access_token);
        //사용자 여부 확인 함수
        Member memberInfo = memberService.selectEmailOneMember(member.getEmail());
        if (memberInfo != null) {
            session.setAttribute("acessToken", access_token);
            session.setAttribute("member", memberInfo);
            mav.setViewName("/common/message");
            mav.addObject("msg", "로그인 성공");
            mav.addObject("loc","/");
        }else{
            mav.setViewName("/user/certification");
            session.setAttribute("member", member);
        }
        return mav;
    }

}
