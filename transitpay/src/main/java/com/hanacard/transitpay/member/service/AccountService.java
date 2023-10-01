package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dto.*;

import java.util.List;
import java.util.Map;

public interface AccountService {
    List<Account> selectBackAccount(int account_id,String account_phone);
    void updateMainAccount(List<String> accountIdList);
    GroupAccountDetail selectAmountMember(String memberId);
    Map<String, String> insertGroupAccount(GroupAccount groupAccount,Map<String, String> groupData);
    GroupAccountDetail selectGroupAccountInfo(int memberId,int groupId);
    GroupAccount selectVirtureAccountNumber(String account_num, int memberId);
    GroupAccount selectUseTypeAccount(String memberId);
    String inputCheckPassword(String groupId);
    void insertGroupMember(String memberType,int memberId,int groupId);
    GroupMember selectGroupMember(int memberId, int groupId);
    void updateAccountBalance(int memberId,Map<String, String> depositData);
    void updateAccountBalanceTransfer(int memberId, Map<String, String> depositData);
    List<GroupAccount> selectGroupAccountStatement(String groupAccount);
    List<Account> JoinGroupAccountAndMemberAccount(int memberId);
    void deleteGroups(String groupId);
    void accountJoinForm(int memberId,String phone);
    List<GroupAccountStatement> selectGroupAccountChart(int groupId,String groupAccount);
    void updatePwState(int memberId, String groupId);
    List<GroupAccount> getTransactionsByAccount(String accountNum);
    List<GroupAccount> getTransactionsByMember(int memberId, int groupId);
    List<Account> selectMyAccountStatement(int memberId);
    void insertGroupMemberNotification(GroupMember[] groupMembers,int amount,int groupId,int travelId);
    List<GroupMember>  selectNotification(int memberId);
    int selectGroupAccount(String groupAccount);
    void calExecution(Map<String, String> calData, int memberId);
    List<Account> selectMyAccountMonthStatement(int memberId);
    List<GroupAccountDetail> selectGroupInfo(String groupId);
    void updateGroupInfo(String groupAccount, String groupDay, String groupDues, String groupAutopay, String groupPassword);
    String selectGroupAutopay(String groupId);

    void updateGroupAutopay(String groupId);

    void deleteGroupAutopay(String groupId);

    List<GroupAccount> getAutoPhoneOfPaymentDayOfMonth();

    void executeAutoPayment(GroupAccount ga);
}
