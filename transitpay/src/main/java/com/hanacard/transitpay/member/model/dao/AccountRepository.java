package com.hanacard.transitpay.member.model.dao;

import com.hanacard.transitpay.member.model.dto.Account;
import com.hanacard.transitpay.member.model.dto.GroupAccount;
import com.hanacard.transitpay.member.model.dto.GroupAccountDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AccountRepository {
    List<Account> selectBackAccount(int memberId);
    void updateMainAccount(Integer accountId);
    void updateSubAccount(Integer accountId);
    GroupAccountDetail selectAmountMember(int memberId);
    void insertGroupAccount(@Param("group_name") String groupName,
                            @Param("group_type") String groupType,
                            @Param("group_account") String groupAccount,
                            @Param("account_num") String accountNum);

    void insertGroupDetail(@Param("group_account") String groupAccount,
                           @Param("g_month") String gMonth,
                           @Param("g_day") int gDay,
                           @Param("g_dues") int gDues,
                           @Param("g_autopay") String gAutopay,
                           @Param("group_pw") int group_pw
                           );

    GroupAccountDetail selectGroupAccountInfo(int memberId);
    String selectVirtureAccountNumber(String account_Num);
    GroupAccount selectUseTypeAccount(int memberId);
}
