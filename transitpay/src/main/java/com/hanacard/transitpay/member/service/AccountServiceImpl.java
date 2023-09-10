package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dao.AccountRepository;
import com.hanacard.transitpay.member.model.dto.Account;
import com.hanacard.transitpay.member.model.dto.GroupAccount;
import com.hanacard.transitpay.member.model.dto.GroupAccountDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class AccountServiceImpl implements AccountService {
    private AccountRepository accountRepository;
    @Autowired
    public AccountServiceImpl(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @Override
    public List<Account> selectBackAccount(int memberId) {
        return accountRepository.selectBackAccount(memberId);
    }

    @Override
    @Transactional
    public void updateMainAccount(List<Integer> accountIdList) {
        accountRepository.updateMainAccount(accountIdList.get(0));
        accountRepository.updateSubAccount(accountIdList.get(1));
    }

    @Override
    public GroupAccountDetail selectAmountMember(String memberId) {
        String memberIdValue = memberId.replaceAll("\\D", "");
        return accountRepository.selectAmountMember(Integer.parseInt(memberIdValue));
    }

    @Override
    @Transactional
    public void insertGroupAccount(GroupAccount groupAccount) {accountRepository.insertGroupAccount(groupAccount.getGroup_name(), groupAccount.getGroup_type(), groupAccount.getAccount_num());}

    @Override
    @Transactional
    public void insertGroupDetail(Map<String, String> groupData) {
        String groupAccount = groupData.get("group_account");
        String gMonth = groupData.get("g_month");
        int gDay = Integer.parseInt(groupData.get("g_day"));
        int gDues = Integer.parseInt(groupData.get("g_dues"));
        String gAutopay = groupData.get("g_autopay");
        System.out.println(groupAccount+" "+gMonth+" "+gDay+" "+gDues+" "+gAutopay);
        accountRepository.insertGroupDetail(groupAccount, gMonth, gDay,gDues,gAutopay);
    }

    @Override
    public GroupAccountDetail selectGroupAccountInfo(String memberId) {
        String memberIdValue = memberId.replaceAll("\\D", "");
        return accountRepository.selectGroupAccountInfo(Integer.parseInt(memberIdValue));

    }
}



