package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dao.AccountRepository;
import com.hanacard.transitpay.member.model.dto.Account;
import com.hanacard.transitpay.member.model.dto.GroupAccount;
import com.hanacard.transitpay.member.model.dto.GroupAccountDetail;
import com.hanacard.transitpay.member.model.dto.GroupMember;
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
    public List<Account> selectBackAccount(int account_id,String account_phone) {
        return accountRepository.selectBackAccount(account_id,account_phone);
    }

    @Override
    @Transactional
    public void updateMainAccount(List<String> accountIdList) {
        accountRepository.updateMainAccount(Integer.parseInt(accountIdList.get(0)), accountIdList.get(1));
        accountRepository.updateSubAccount(Integer.parseInt(accountIdList.get(0)), accountIdList.get(2));
    }

    @Override
    public GroupAccountDetail selectAmountMember(String memberId) {
        String memberIdValue = memberId.replaceAll("\\D", "");
        return accountRepository.selectAmountMember(Integer.parseInt(memberIdValue));
    }

    @Override
    @Transactional
    public Map<String, String> insertGroupAccount(GroupAccount groupAccount,Map<String, String> groupData) {
        // 13자리를 무작위로 최종 계좌 번호 형식 생성
        String virtualAccountNumber = generateRandomDigits();
        // 모임 개설
        accountRepository.insertGroupAccount(groupAccount.getGroup_name(), groupAccount.getGroup_type(),virtualAccountNumber, groupAccount.getAccount_num(),groupAccount.getGroup_leader());
        // 계좌 그룹계좌인거 상태 1로 만들기
        accountRepository.updateGroupAccount(groupAccount.getAccount_num());
        // 모임 통장 개설
        groupData.put("group_account",virtualAccountNumber);
        accountRepository.insertGroupDetail(groupData);
        return groupData;
    }
    // 중복 없는 무작위 숫자 생성 메서드
    private static String generateRandomDigits() {
        Random random = new Random();
        StringBuilder formattedNumber = new StringBuilder();

        // 첫 번째 세 자리 (XXX) 생성
        formattedNumber.append(random.nextInt(10));
        formattedNumber.append(random.nextInt(10));
        formattedNumber.append(random.nextInt(10));
        formattedNumber.append("-");

        // 다음 여섯 자리 (XXXXXX) 생성
        for (int i = 0; i < 6; i++) {
            formattedNumber.append(random.nextInt(10));
        }
        formattedNumber.append("-");

        // 마지막 다섯 자리 (XXXXX) 생성
        for (int i = 0; i < 5; i++) {
            formattedNumber.append(random.nextInt(10));
        }

        return formattedNumber.toString();
    }

    @Override
    public GroupAccountDetail selectGroupAccountInfo(String memberId) {
        String memberIdValue = memberId.replaceAll("\\D", "");
        return accountRepository.selectGroupAccountInfo(Integer.parseInt(memberIdValue));

    }

    @Override
    public GroupAccount selectVirtureAccountNumber(String account_num, int memberId) {
        return accountRepository.selectVirtureAccountNumber(account_num,memberId);
    }

    @Override
    public GroupAccount selectUseTypeAccount(String memberId) {
        return accountRepository.selectUseTypeAccount(Integer.parseInt(memberId));
    }

    @Override
    public String inputCheckPassword(String groupId) {
        return accountRepository.inputCheckPassword(groupId);
    }

    @Override
    public void insertGroupMember(String memberType,int memberId, int groupId) {
        accountRepository.insertGroupMember(memberType,memberId,groupId);

    }

    @Override
    public GroupMember selectGroupMember(int memberId, int groupId) {
        return accountRepository.selectGroupMember(memberId,groupId);
    }

    @Override
    @Transactional
    public void updateAccountBalance(int memberId, Map<String, String> depositData) {
        //계좌
        String accountBank = (String) depositData.get("accountBank");
        String accountNum = (String) depositData.get("accountNum");
        //모임통장
        String groupName = (String) depositData.get("groupName");
        String groupAccount = (String) depositData.get("groupAccount");
        String balance = (String) depositData.get("balance");
        accountRepository.insertAccountStatement(accountNum,groupAccount,"OUT",Integer.parseInt(balance),"테스트용1");
        System.out.println(1);
        accountRepository.insertGroupAccountStatement(accountNum,groupAccount,"IN",Integer.parseInt(balance),"테스트용2");
        System.out.println(2);
        accountRepository.updateAccountBalance(memberId, accountNum, Integer.parseInt(balance), accountBank);
        System.out.println(3);
        accountRepository.updateGroupAccountBalance(groupAccount,Integer.parseInt(balance));
        System.out.println(4);
    }

    @Override
    public List<GroupAccount> selectGroupAccountStatement(String groupAccount) {
        return accountRepository.selectGroupAccountStatement(groupAccount);
    }

    @Override
    public Account JoinGroupAccountAndMemberAccount(int memberId) {
        return accountRepository.JoinGroupAccountAndMemberAccount(memberId);
    }

    @Override
    @Transactional
    public void deleteGroups(String groupId) {
        accountRepository.deleteGroups(Integer.parseInt(groupId));
    }

    @Override
    public void accountJoinForm(int memberId,String phone) {
        accountRepository.accountJoinForm(memberId,phone);
    }
}



