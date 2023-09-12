package com.hanacard.transitpay.member.model.dao;

import com.hanacard.transitpay.member.model.dto.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRepository {
    Member selectOneMember(String phone);
    void insertKakaoAndPhoneMember(Member member);
    Member selectEmailOneMember(String email);
}
