package com.hanacard.transitpay.member.model.dao;

import com.hanacard.transitpay.member.model.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface AccountRepository {
    List<Account> selectBackAccount(@Param("account_id") int account_id,
                                    @Param("account_phone") String account_phone);
    void updateMainAccount(@Param("account_id") int account_id,
                           @Param("account_phone") String account_phone);
    void updateSubAccount(@Param("account_id") int account_id,
                          @Param("account_phone") String account_phone);
    GroupAccountDetail selectAmountMember(int memberId);
    void insertGroupAccount(@Param("group_name") String groupName,
                            @Param("group_type") String groupType,
                            @Param("group_account") String groupAccount,
                            @Param("account_num") String accountNum,
                            @Param("group_leader") int groupLeader);

    void insertGroupDetail(Map<String, String> groupData);
    GroupAccountDetail selectGroupAccountInfo(int memberId,int groupId);
    GroupAccount selectVirtureAccountNumber(String account_num,int memberId);
    GroupAccount selectUseTypeAccount(int memberId);
    String inputCheckPassword(String groupId);
    void updateGroupAccount(String account_num);
    void insertGroupMember(String memberType,int memberId,int groupId,int pw_state);
    GroupMember selectGroupMember(int memberId, int groupId);
    void updateAccountBalance(int accountId, String accountNum, int balance, String accountBank);
    void updateGroupAccountBalance(String groupAccount, int balance);
    void insertAccountStatement(String accountNum, String groupAccount, String type, int balance, String accountContent);
    void insertGroupAccountStatement(String accountNum, String groupAccount, String type, int balance, String accountContent);
    List<GroupAccount> selectGroupAccountStatement(String groupAccount);
    List<Account> JoinGroupAccountAndMemberAccount(int memberId);
    void deleteGroups(int groupId);
    void accountJoinForm(int memberId,String phone);
    List<GroupAccountStatement> selectGroupAccountChart(int groupId,String groupAccount);
    void updatePwState(int memberId, String groupId);
    List<GroupAccount> getTransactionsByAccount(String accountNum);
    List<GroupAccount> getTransactionsByMember(int memberId, int groupId);
    List<Account> selectMyAccountStatement(int memberId);
    void insertAccountStatementTransfer(String accountNum, String groupAccount, String type, int balance, String accountContent);
    void insertGroupAccountStatementTransfer(String accountNum, String groupAccount, String type, int balance, String accountContent);
    void updateAccountBalanceTransfer(@Param("account_id") int account_id,
                                      @Param("account_num") String account_num,
                                      @Param("balance") int balance,
                                      @Param("account_bank") String account_bank);
    void updateGroupAccountBalanceTransfer(String groupAccount, int balance);
    void insertGroupMemberNotification(GroupMember member);
    List<GroupMember> selectNotification(int memberId);
    int selectGroupAccount(String groupAccount);
    void calExecution(int groupId, int memberId,int travelId);
    List<Account> selectMyAccountMonthStatement(int memberId);
    List<GroupAccountDetail> selectGroupInfo(String groupId);
    void updateGroupInfo(String groupAccount, int groupDay, int groupDues, String groupAutopay, int groupPassword);
    String selectGroupAutopay(String groupId);

    void updateGroupAutopay(String groupId);

    void deleteGroupAutopay(String groupId);

    void calExecutionHistory(int groupId, int memberId, int travelId, int balance);
    List<GroupAccount> getAutoPhoneOfPaymentDayOfMonth();
}
