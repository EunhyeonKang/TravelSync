package com.hanacard.transitpay.member.service;


import com.hanacard.transitpay.member.model.dto.Member;

import java.util.List;

public interface MemberService {
    Member selectOneMember(String phone);
    String sendAuthenticationCode(String phoneNumber);
    String getKakaoToken(String code);
    Member getKakaoUserInfo(String code);
    void insertKakaoAndPhoneMember(Member member);
    Member selectEmailOneMember(String email);
    List<Member> selectAllGroupMembers(int groupId);
}
