package com.hanacard.transitpay.member.model.dao;

import com.hanacard.transitpay.member.model.dto.Account;
import com.hanacard.transitpay.member.model.dto.GroupAccount;
import com.hanacard.transitpay.member.model.dto.GroupAccountDetail;
import com.hanacard.transitpay.member.model.dto.GroupMember;
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

    GroupAccountDetail selectGroupAccountInfo(int memberId);
    GroupAccount selectVirtureAccountNumber(String account_num,int memberId);
    GroupAccount selectUseTypeAccount(int memberId);
    String inputCheckPassword(String groupId);
    void updateGroupAccount(String account_num);
    void insertGroupMember(String memberType,int memberId,int groupId);
    GroupMember selectGroupMember(int memberId, int groupId);
    void updateAccountBalance(@Param("account_id") int account_id,
                              @Param("account_num") String account_num,
                              @Param("balance") int balance,
                              @Param("account_bank") String account_bank);
    void updateGroupAccountBalance(String groupAccount, int balance);

    void insertAccountStatement(String accountNum, String groupAccount, String type, int balance, String accountContent);

    void insertGroupAccountStatement(String accountNum, String groupAccount, String type, int balance, String accountContent);

    List<GroupAccount> selectGroupAccountStatement(String groupAccount);
    Account JoinGroupAccountAndMemberAccount(int memberId);
    void deleteGroups(int groupId);
    void accountJoinForm(int memberId,String phone);
}
