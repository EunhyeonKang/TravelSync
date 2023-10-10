package com.hanacard.transitpay.member.model.dao;

import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.member.model.dto.Point;
import com.hanacard.transitpay.member.model.dto.Search;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminRepository {
    List<Member> selectMember();
    List<Search> searchLocation();
    List<String> optionLocation();
    List<Search> searchLocationByDate(String option);
    int searchCount();
    List<Member> recommendOfMember();
    void cashbackPayment(String code);
    int selectPoint(int memberId);
    List<Point> selectPointListOfMember(int memberId);
}

