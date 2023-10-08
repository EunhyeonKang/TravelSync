package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dao.AccountRepository;
import com.hanacard.transitpay.member.model.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
public class AccountServiceImpl implements AccountService {
    private AccountRepository accountRepository;
    private static final String[] BANKS = {
            "하나저축은행", "하나은행", "하나손해보험"
    };
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
    public GroupAccountDetail selectGroupAccountInfo(int memberId,int groupId) {
        return accountRepository.selectGroupAccountInfo(memberId,groupId);

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
    public void insertGroupMember(String memberType,int memberId, int groupId,int pw_state) {
        accountRepository.insertGroupMember(memberType,memberId,groupId,pw_state);

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
        String transactionContent = (String)depositData.get("transaction_content");
        accountRepository.insertAccountStatement(accountNum,groupAccount,"OUT",Integer.parseInt(balance),transactionContent);
        accountRepository.insertGroupAccountStatement(accountNum,groupAccount,"IN",Integer.parseInt(balance),transactionContent);
        accountRepository.updateAccountBalance(memberId, accountNum, Integer.parseInt(balance), accountBank);
        accountRepository.updateGroupAccountBalance(groupAccount,Integer.parseInt(balance));
    }

    @Override
    @Transactional
    public void executeAutoPayment(GroupAccount ga) {
//        System.out.println(ga);
        accountRepository.insertAccountStatement(ga.getAccount_num(),ga.getGroup_account(),"OUT",ga.getG_dues(),"(주계좌)자동이체");
        accountRepository.insertGroupAccountStatement(ga.getAccount_num(),ga.getGroup_account(),"IN",ga.getG_dues(),"(주계좌)자동이체");
        accountRepository.updateAccountBalance(ga.getMember_id(), ga.getAccount_num(), ga.getG_dues(), ga.getAccount_bank());
        accountRepository.updateGroupAccountBalance(ga.getGroup_account(),ga.getG_dues());
    }

    @Override
    @Transactional
    public void insertHanaAccount(int memberId, String phone) {
        String accountNumber = generateRandomAccountNumber();
        int balance = generateRandomBalance();
        String bank = generateRandomBank();
        String password = generateRandomPassword(); // 4자리 랜덤 숫자로 비밀번호 생성

        accountRepository.insertHanaAccount(memberId,accountNumber,bank,balance,phone,Integer.parseInt(password));
    }
    private String generateRandomPassword() {
        Random random = new Random();
        int password = random.nextInt(10000); // 0부터 9999까지의 난수 생성
        return String.format("%04d", password); // 4자리로 포맷팅
    }
    // 12자리의 랜덤 계좌번호 생성
    private static String generateRandomAccountNumber() {
        Random random = new Random();
        StringBuilder accountNumber = new StringBuilder();
        for (int i = 0; i < 12; i++) {
            int digit = random.nextInt(10);
            accountNumber.append(digit);
        }
        return accountNumber.toString();
    }

    // 1,000원부터 10,000,000원까지의 랜덤 잔액 생성
    private static int generateRandomBalance() {
        Random random = new Random();
        return random.nextInt(10000001) + 1000; // 1000원 ~ 10,000,000원
    }

    // 랜덤으로 은행 선택
    private static String generateRandomBank() {
        Random random = new Random();
        int index = random.nextInt(BANKS.length);
        return BANKS[index];
    }
    @Override
    @Transactional
    public void updateAccountBalanceTransfer(int memberId, Map<String, String> depositData) {
        //계좌
        String accountBank = (String) depositData.get("accountBank");
        String accountNum = (String) depositData.get("accountNum");
        //모임통장
        String groupName = (String) depositData.get("groupName");
        String groupAccount = (String) depositData.get("groupAccount");
        String balance = (String) depositData.get("balance");
        String transactionContent = (String)depositData.get("transaction_content");
        accountRepository.insertAccountStatementTransfer(accountNum,groupAccount,"IN",Integer.parseInt(balance),transactionContent);
        accountRepository.insertGroupAccountStatementTransfer(accountNum,groupAccount,"OUT",Integer.parseInt(balance),transactionContent);
        accountRepository.updateAccountBalanceTransfer(memberId, accountNum, Integer.parseInt(balance), accountBank);
        accountRepository.updateGroupAccountBalanceTransfer(groupAccount,Integer.parseInt(balance));
    }
    @Override
    public List<GroupAccount> selectGroupAccountStatement(String groupAccount) {
        return accountRepository.selectGroupAccountStatement(groupAccount);
    }

    @Override
    public List<Account> JoinGroupAccountAndMemberAccount(int memberId) {
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

    @Override
    public List<GroupAccountStatement> selectGroupAccountChart(int groupId,String groupAccount) {
        return accountRepository.selectGroupAccountChart(groupId,groupAccount);
    }

    @Override
    @Transactional
    public void updatePwState(int memberId, String groupId) {
        accountRepository.updatePwState(memberId,groupId);
    }

    @Override
    public List<GroupAccount> getTransactionsByAccount(String accountNum) {
        return accountRepository.getTransactionsByAccount(accountNum);
    }

    @Override
    public List<GroupAccount> getTransactionsByMember(int memberId, int groupId) {
        return accountRepository.getTransactionsByMember(memberId,groupId);
    }

    @Override
    public List<Account> selectMyAccountStatement(int memberId) {
        return accountRepository.selectMyAccountStatement(memberId);
    }

    @Override
    @Transactional
    public void insertGroupMemberNotification(GroupMember[] groupMembers,int amount,int groupId,int travelId) {
        double dividedAmount = (double) amount / groupMembers.length;
        int roundedAmount = (int) Math.round(dividedAmount);
        for(GroupMember member : groupMembers){
            member.setAmount(roundedAmount);
            member.setGroup_id(groupId);
            member.setTravel_id(travelId);
            accountRepository.insertGroupMemberNotification(member);
        }

    }

    @Override
    public List<GroupMember> selectNotification(int memberId) {
        return accountRepository.selectNotification(memberId);
    }

    @Override
    public int selectGroupAccount(String groupAccount) {
        return accountRepository.selectGroupAccount(groupAccount);
    }

    @Override
    @Transactional
    public void calExecution(Map<String, String> calData, int memberId) {
        //계좌
        String accountBank = (String) calData.get("accountBank");
        String accountNum = (String) calData.get("accountNum");
        //모임통장
        String groupName = (String) calData.get("groupName");
        String groupAccount = (String) calData.get("groupAccount");
        String balance = (String) calData.get("amount");
        String groupId = (String)calData.get("groupId");
        String travelId = (String)calData.get("travelId");
        accountRepository.insertAccountStatement(accountNum,groupAccount,"OUT",Integer.parseInt(balance),"여행 경비-회비 정산");
        accountRepository.insertGroupAccountStatement(accountNum,groupAccount,"IN",Integer.parseInt(balance),"여행 경비-회비 정산");
        accountRepository.updateAccountBalance(memberId, accountNum, Integer.parseInt(balance), accountBank);
        accountRepository.updateGroupAccountBalance(groupAccount,Integer.parseInt(balance));
        accountRepository.calExecution(Integer.parseInt(groupId),memberId,Integer.parseInt(travelId));
        accountRepository.calExecutionHistory(Integer.parseInt(groupId),memberId,Integer.parseInt(travelId),Integer.parseInt(balance));
    }

    @Override
    public List<Account> selectMyAccountMonthStatement(int memberId) {
        return accountRepository.selectMyAccountMonthStatement(memberId);
    }

    @Override
    public List<GroupAccountDetail> selectGroupInfo(String groupId) {
        return accountRepository.selectGroupInfo(groupId);
    }

    @Override
    public void updateGroupInfo(String groupAccount, String groupDay, String groupDues, String groupAutopay, String groupPassword) {
        accountRepository.updateGroupInfo(groupAccount,Integer.parseInt(groupDay),Integer.parseInt(groupDues),groupAutopay,Integer.parseInt(groupPassword));
    }

    @Override
    public String selectGroupAutopay(String groupId) {
        return accountRepository.selectGroupAutopay(groupId);
    }

    @Override
    public void updateGroupAutopay(String groupId) {
        accountRepository.updateGroupAutopay(groupId);
    }

    @Override
    public void deleteGroupAutopay(String groupId) {
        accountRepository.deleteGroupAutopay(groupId);
    }

    @Override
    public  List<GroupAccount> getAutoPhoneOfPaymentDayOfMonth() {
        return accountRepository.getAutoPhoneOfPaymentDayOfMonth();
    }

}



