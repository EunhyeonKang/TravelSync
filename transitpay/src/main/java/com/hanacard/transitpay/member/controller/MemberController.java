package com.hanacard.transitpay.member.controller;

import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class MemberController {
    private final MemberService memberService;
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);


    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }


    @PostMapping("/checkPhone")
    @ResponseBody
    public String checkPhone(@RequestBody Member member) {
        // Member 객체에 요청 데이터가 매핑됩니다.
        String phone = member.getPhone();
        String groupName = member.getGroupName();
        String authenticationCode=memberService.sendAuthenticationCode(phone,groupName);
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
                logger.debug("카카오 로그인 - 사용자: {}", member);
                return ResponseEntity.ok("로그인 성공");
            }else{
                memberService.insertKakaoAndPhoneMember(member);
                Member memberId = memberService.selectOneMember(member.getPhone());
                session.setAttribute("member", memberId);
                logger.debug("카카오 로그인 - 사용자: {}", member);
                return ResponseEntity.ok("로그인 성공");
            }

        } catch (Exception e) {
            // 예외 처리 로직
            logger.error("카카오 로그인 실패 - 사용자: {}", member);
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
        logger.debug("카카오 로그인");
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
            logger.debug("카카오 로그인 성공 - 사용자: {}", member);
            mav.addObject("msg", "로그인 성공");
            mav.addObject("loc","/");
        }else{
            mav.setViewName("/user/certification");
            session.setAttribute("member", member);
        }
        return mav;
    }
    @PostMapping("/selectAllGroupMembers")
    public ResponseEntity<List<Member>> selectAllGroupMembers(@RequestParam int groupId) {
        try {
            List<Member> selectAllGroupMember = memberService.selectAllGroupMembers(groupId);
            return ResponseEntity.ok(selectAllGroupMember);
        } catch (Exception e) {
            return new ResponseEntity<>(null);
        }
    }

    @PostMapping(value = "/joinMember.do")
    public ModelAndView joinMember(Member member, MultipartFile files[], HttpServletRequest request, Model model) throws Exception {
        ModelAndView mav = new ModelAndView();
        memberService.joinMember(member,files,request.getSession().getServletContext().getRealPath("/resources/upload/profile/"));
        mav.addObject("msg", "회원가입 성공");
        mav.addObject("loc","/");
        mav.setViewName("/common/message");
        return mav;
    }

    @PostMapping(value = "/loginMember")
    public ResponseEntity<Member> loginMember(@RequestBody Member member,HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession();
            ModelAndView mav = new ModelAndView();
            Member loginMember = memberService.loginMember(member.getEmail(),member.getPw());
            if(loginMember!=null) {

                session.setAttribute("member", loginMember);
                mav.addObject("msg", "로그인 성공");
            }else{
                mav.addObject("msg", "로그인 실패");
            }
            mav.addObject("loc", "/");
            return ResponseEntity.ok(loginMember);
        } catch (Exception e) {
            return new ResponseEntity<>(null);
        }
    }

    @PostMapping(value = "/updateInviteAccept")
    public ResponseEntity<String> updateInviteAccept(@RequestParam String code,HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            memberService.updateInviteAccept(code,member.getMember_id());
            return ResponseEntity.ok("추천인코드 업데이트 성공");
        } catch (Exception e) {
            return new ResponseEntity<>(null);
        }
    }
}
