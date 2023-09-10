package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dto.Account;
import com.hanacard.transitpay.member.model.dto.GroupAccount;
import com.hanacard.transitpay.member.model.dto.GroupAccountDetail;

import java.util.List;
import java.util.Map;

public interface AccountService {
    List<Account> selectBackAccount(int memberId);
    void updateMainAccount(List<Integer> accountIdList);
    GroupAccountDetail selectAmountMember(String memberId);
    void insertGroupAccount(GroupAccount groupAccount);
    void insertGroupDetail(Map<String,String> groupData);
    GroupAccountDetail selectGroupAccountInfo(String memberId);
}
