package com.hanacard.transitpay.member.service;


import com.hanacard.transitpay.member.model.dto.Member;

public interface MemberService {
    Member selectOneMember(String PhoneNumber);
    String sendAuthenticationCode(String phoneNumber);

}
