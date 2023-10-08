package com.hanacard.transitpay.member.service;


import com.hanacard.transitpay.member.model.dto.Member;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MemberService {
    Member selectOneMember(String phone);
    String sendAuthenticationCode(String phoneNumber,String name,int day, int amount);
    String sendAuthenticationCode(String phone,String groupname);
    String getKakaoToken(String code);
    Member getKakaoUserInfo(String code);
    void insertKakaoAndPhoneMember(Member member);
    Member selectEmailOneMember(String email);
    List<Member> selectAllGroupMembers(int groupId);
    void joinMember(Member member, MultipartFile[] files, String realPath) throws Exception;
    Member loginMember(String email, String pw) throws Exception;
    void updateInviteAccept(String code, int memberId);
}
