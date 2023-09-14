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
import java.util.Random;

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
    public void insertGroupAccount(GroupAccount groupAccount) {
        String originalNumber = groupAccount.getAccount_num();
        String branchCode = originalNumber.substring(0, 3);
        // 중간 9자리를 무작위로 생성 (겹치지 않게)
        String middleDigits = generateRandomDigits(9);
        // 마지막 2자리는 상품 구분
        String productCode = originalNumber.substring(originalNumber.length() - 2);
        // 최종 계좌 번호 형식 생성
        String virtualAccountNumber = branchCode + "-" + middleDigits + "-" + productCode;
        accountRepository.insertGroupAccount(groupAccount.getGroup_name(), groupAccount.getGroup_type(),virtualAccountNumber, originalNumber);
    }
    // 중복 없는 무작위 숫자 생성 메서드
    private static String generateRandomDigits(int length) {
        StringBuilder digits = new StringBuilder();
        String allDigits = "0123456789";
        Random random = new Random();

        while (digits.length() < length) {
            char randomDigit = allDigits.charAt(random.nextInt(allDigits.length()));
            if (digits.indexOf(String.valueOf(randomDigit)) == -1) {
                digits.append(randomDigit);
            }
        }

        return digits.toString();
    }
    @Override
    @Transactional
    public void insertGroupDetail(Map<String, String> groupData) {
        String groupAccount = groupData.get("group_account");
        String gMonth = groupData.get("g_month");
        int gDay = Integer.parseInt(groupData.get("g_day"));
        int gDues = Integer.parseInt(groupData.get("g_dues"));
        String gAutopay = groupData.get("g_autopay");
        int groupPw = Integer.parseInt(groupData.get("group_pw"));
        System.out.println(groupAccount+" "+gMonth+" "+gDay+" "+gDues+" "+gAutopay+" "+groupPw);
        accountRepository.insertGroupDetail(groupAccount, gMonth, gDay,gDues,gAutopay,groupPw);
    }

    @Override
    public GroupAccountDetail selectGroupAccountInfo(String memberId) {
        String memberIdValue = memberId.replaceAll("\\D", "");
        return accountRepository.selectGroupAccountInfo(Integer.parseInt(memberIdValue));

    }

    @Override
    public String selectVirtureAccountNumber(String account_Num) {
        return accountRepository.selectVirtureAccountNumber(account_Num);
    }

    @Override
    public GroupAccount selectUseTypeAccount(String memberId) {
        return accountRepository.selectUseTypeAccount(Integer.parseInt(memberId));
    }
}



