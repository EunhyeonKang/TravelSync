package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dao.AdminRepository;
import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.member.model.dto.Point;
import com.hanacard.transitpay.member.model.dto.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class AdminServiceImpl implements AdminService {
    private AdminRepository adminRepository;
    @Autowired
    public AdminServiceImpl(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public List<Member> selectMember() {
        return adminRepository.selectMember();
    }

    @Override
    public List<Search> searchLocation() {
        return adminRepository.searchLocation();
    }

    @Override
    public List<String> optionLocation() {
        return adminRepository.optionLocation();
    }

    @Override
    public List<Search> searchLocationByDate(String option) {
        return adminRepository.searchLocationByDate(option);
    }

    @Override
    public int searchCount() {
        return adminRepository.searchCount();
    }

    @Override
    public List<Member> recommendOfMember() {
        return adminRepository.recommendOfMember();
    }

    @Override
    @Transactional
    public void cashbackPayment(String code, String recode) {
        adminRepository.cashbackPayment(code);
        adminRepository.cashbackPayment(recode);
    }

    @Override
    public int selectPoint(int memberId) {
        return adminRepository.selectPoint(memberId);
    }

    @Override
    public List<Point> selectPointListOfMember(int memberId) {
        return adminRepository.selectPointListOfMember(memberId);
    }
}