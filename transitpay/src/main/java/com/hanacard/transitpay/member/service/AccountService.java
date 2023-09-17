package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dto.Account;
import com.hanacard.transitpay.member.model.dto.GroupAccount;
import com.hanacard.transitpay.member.model.dto.GroupAccountDetail;

import java.util.List;
import java.util.Map;

public interface AccountService {
    List<Account> selectBackAccount(int account_id,String account_phone);
    void updateMainAccount(List<String> accountIdList);
    GroupAccountDetail selectAmountMember(String memberId);
    void insertGroupAccount(GroupAccount groupAccount);
    void insertGroupDetail(Map<String,String> groupData);
    GroupAccountDetail selectGroupAccountInfo(String memberId);
    String selectVirtureAccountNumber(String account_Num);

    GroupAccount selectUseTypeAccount(String memberId);
    String inputCheckPassword(String groupId);
}
