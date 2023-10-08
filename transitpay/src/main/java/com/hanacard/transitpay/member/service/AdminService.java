package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.member.model.dto.Search;

import java.util.List;

public interface AdminService {
    List<Member> selectMember();
    List<Search> searchLocation();
    List<String> optionLocation();
    List<Search> searchLocationByDate(String option);
    int searchCount();
    List<Member> recommendOfMember();
}
