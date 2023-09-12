package com.hanacard.transitpay.member.service;


import com.hanacard.transitpay.member.model.dto.Member;

public interface MemberService {
    Member selectOneMember(String phone);
    String sendAuthenticationCode(String phoneNumber);
    String getKakaoToken(String code);
    Member getKakaoUserInfo(String code);
    void shareKakaoGroup(String accessToken,Member member);
    void insertKakaoAndPhoneMember(Member member);
    Member selectEmailOneMember(String email);
}
