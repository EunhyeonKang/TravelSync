package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dto.Account;
import com.hanacard.transitpay.member.model.dto.GroupAccount;
import com.hanacard.transitpay.member.model.dto.GroupAccountDetail;
import com.hanacard.transitpay.member.model.dto.GroupMember;

import java.util.List;
import java.util.Map;

public interface AccountService {
    List<Account> selectBackAccount(int account_id,String account_phone);
    void updateMainAccount(List<String> accountIdList);
    GroupAccountDetail selectAmountMember(String memberId);
    void insertGroupAccount(GroupAccount groupAccount,Map<String, String> groupData);
    GroupAccountDetail selectGroupAccountInfo(String memberId);
    String selectVirtureAccountNumber(String account_num);
    GroupAccount selectUseTypeAccount(String memberId);
    String inputCheckPassword(String groupId);
    void insertGroupMember(String memberType,int memberId,int groupId);
    GroupMember selectGroupMember(int memberId, int groupId);
}
