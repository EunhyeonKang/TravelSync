package com.hanacard.transitpay.member.model.dao;

import com.hanacard.transitpay.member.model.dto.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberRepository {
    Member selectOneMember(String phone);
    void insertKakaoAndPhoneMember(Member member);
    Member selectEmailOneMember(String email);
    List<Member> selectAllGroupMembers(int groupId);
    void joinMember(Member member);
    void updateRecommendCode(String recode, String email);
    Member loginMember(String email, String pw);
}
