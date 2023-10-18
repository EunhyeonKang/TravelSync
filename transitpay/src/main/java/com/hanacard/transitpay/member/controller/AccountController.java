package com.hanacard.transitpay.member.controller;

import com.hanacard.transitpay.member.model.dto.*;
import com.hanacard.transitpay.member.service.AccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
public class AccountController {
    private final AccountService accountService;
    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    public AccountController(AccountService accountService) {
        this.accountService = accountService;
    }

    @PostMapping("/selectBackAccount")
    public ResponseEntity<List<Account>> selectBackAccount(HttpServletRequest request) {
        HttpSession session = request.getSession();
        try {
            Member member = (Member) session.getAttribute("member");
            List<Account> account = accountService.selectBackAccount(member.getMember_id(),member.getPhone());
            session.setAttribute("account",account);
            return ResponseEntity.ok(account);
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/updateMainAccount")
    public ResponseEntity<String> updateMainAccount(@RequestBody List<String> accountIdList) {
        try {
            accountService.updateMainAccount(accountIdList);
            return ResponseEntity.ok("계좌 변경 성공");
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("계좌 변경 실패");
        }
    }

    @PostMapping("/selectAmountMember")
    public ResponseEntity<Integer> selectAmountMember(@RequestBody String memberId) {

        try {
            GroupAccountDetail balance = accountService.selectAmountMember(memberId);
            return ResponseEntity.ok(balance.getG_balance());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(-1);
        }
    }

    @GetMapping("insertGroupAccount")
    public ResponseEntity<String> insertGroupAccount(GroupAccount groupAccount, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            session.setAttribute("groupAccount", groupAccount);
            return ResponseEntity.ok("모임통장 개설 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("모임통장 개설 실패");
        }
    }

    @PostMapping("/insertGroupDetail")
    public ResponseEntity<String> insertGroupDetail(@RequestBody Map<String, String> groupData, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            GroupAccount groupAccount = (GroupAccount)session.getAttribute("groupAccount");

            logger.info("Received formData: {}", groupData);
            Map<String, String> groupAccountDetail = accountService.insertGroupAccount(groupAccount,groupData);
            int groupId = accountService.selectGroupAccount(groupAccountDetail.get("group_account"));
            session.setAttribute("groupId", groupId);
            session.setAttribute("groupAccountDetail", groupAccountDetail);
            return ResponseEntity.ok("모임통장 개설 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("모임통장 개설 실패");
        }
    }

    @PostMapping("/selectGroupAccountInfo")
    public ResponseEntity<GroupAccountDetail> selectGroupAccountInfo(@RequestParam int memberId,@RequestParam int groupId,HttpServletRequest request) {
        try {
            GroupAccountDetail groupAccountDetail = accountService.selectGroupAccountInfo(memberId,groupId);
            HttpSession session = request.getSession();
            session.setAttribute("groupAccountDetail",groupAccountDetail);
            return ResponseEntity.ok(groupAccountDetail);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/selectVirtureAccountNumber")
    public ResponseEntity<GroupAccount> selectVirtureAccountNumber(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            GroupAccount groupAccount = (GroupAccount) session.getAttribute("groupAccount");
            Member member = (Member) session.getAttribute("member");
            GroupAccount groupAccountInfo = accountService.selectVirtureAccountNumber(groupAccount.getAccount_num(),member.getMember_id());
            session.setAttribute("groupAccountInfo",groupAccountInfo);
            accountService.insertGroupMember("L",groupAccount.getGroup_leader(), groupAccountInfo.getGroup_id(),1);
            return ResponseEntity.ok(groupAccountInfo);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }


    @PostMapping("/selectUseTypeAccount")
    public ResponseEntity<GroupAccount> selectUseTypeAccount(String memberId,HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            GroupAccount groupAccount = accountService.selectUseTypeAccount(memberId);
            session.setAttribute("groupAccount",groupAccount);
            return ResponseEntity.ok(groupAccount);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/inputCheckPassword")
    public ResponseEntity<String> inputCheckPassword(String groupId,HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member) session.getAttribute("member");
            String grouppwd = accountService.inputCheckPassword(groupId);
            accountService.updatePwState(member.getMember_id(),groupId);
            session.setAttribute("grouppwd",grouppwd);
            return ResponseEntity.ok(grouppwd);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/selectGroupMember")
    public ResponseEntity<GroupMember> selectGroupMember(String groupId,HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member) session.getAttribute("member");
            GroupAccount groupAccount = (GroupAccount) session.getAttribute("groupAccount");
            GroupMember groupMember = accountService.selectGroupMember(member.getMember_id(),Integer.parseInt(groupId));
            session.setAttribute("groupMember",groupMember);
            return ResponseEntity.ok(groupMember);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }

    }
    @PostMapping("/insertGroupMember")
    public ResponseEntity<String> insertGroupMember(String groupId,HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member) session.getAttribute("member");
            accountService.insertGroupMember("M",member.getMember_id(), Integer.parseInt(groupId),0);
            return ResponseEntity.ok("모임원추가 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }

    }

    @PostMapping("/insertGroupAccountDeposit")
    public ResponseEntity<String> insertGroupAccountDeposit(@RequestBody Map<String, String> depositData, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member) session.getAttribute("member");
            accountService.updateAccountBalance(member.getMember_id(),depositData);
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/insertGroupAccountTransfer")
    public ResponseEntity<String> insertGroupAccountTransfer(@RequestBody Map<String, String> depositData, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member) session.getAttribute("member");
            accountService.updateAccountBalanceTransfer(member.getMember_id(),depositData);
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/selectGroupAccountStatement")
    public ResponseEntity<List<GroupAccount>> selectGroupAccountStatement(String groupAccount){
        try {
            List<GroupAccount> groupAccountList = accountService.selectGroupAccountStatement(groupAccount);
            return ResponseEntity.ok(groupAccountList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("JoinGroupAccountAndMemberAccount")
    public ResponseEntity<List<Account>> JoinGroupAccountAndMemberAccount(HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            List<Account> groupAccountList = accountService.JoinGroupAccountAndMemberAccount(member.getMember_id());
            session.setAttribute("groupAccountList",groupAccountList);
            return ResponseEntity.ok(groupAccountList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("deleteGroups")
    public ResponseEntity<String> deleteGroups(int groupId,HttpServletRequest request){
        try {
            HttpSession session = request.getSession(); // 세션 가져오기
            session.removeAttribute("groupAccount");
            session.removeAttribute("GroupAccountDetail");
            Member member = (Member)session.getAttribute("member");
            accountService.deleteGroups(groupId,member.getMember_id());
            return ResponseEntity.ok("모임탈퇴 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("모임탈퇴 실패");
        }
    }
    @PostMapping("accountJoinForm")
    public ResponseEntity<String> accountJoinForm(HttpServletRequest request){
        try {
            HttpSession session = request.getSession(); // 세션 가져오기
            Member member = (Member)session.getAttribute("member");
            accountService.accountJoinForm(member.getMember_id(),member.getPhone());
            return ResponseEntity.ok("계좌개설 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("계좌개설 실패");
        }
    }
    @PostMapping("/selectGroupAccountChart")
    public ResponseEntity<List<GroupAccountStatement>> selectGroupAccountChart(@RequestParam int groupId,@RequestParam String  groupAccount){
        try {
            List<GroupAccountStatement> groupAccountStatement = accountService.selectGroupAccountChart(groupId,groupAccount);
            return ResponseEntity.ok(groupAccountStatement);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/getTransactionsByAccount")
    public ResponseEntity<List<GroupAccount>> getTransactionsByAccount(String accountNum){
        try {
            List<GroupAccount> getTransactionsByAccount = accountService.getTransactionsByAccount(accountNum);
            return ResponseEntity.ok(getTransactionsByAccount);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/getTransactionsByMember")
    public ResponseEntity<List<GroupAccount>> getTransactionsByMember(@RequestParam int groupId,@RequestParam int memberId){
        try {
            List<GroupAccount> getTransactionsByMember = accountService.getTransactionsByMember(memberId,groupId);
            return ResponseEntity.ok(getTransactionsByMember);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/selectMyAccountStatement")
    public ResponseEntity<List<Account>> selectAccountStatement(HttpServletRequest request){
        try {
            HttpSession session = request.getSession(); // 세션 가져오기
            Member member = (Member)session.getAttribute("member");
            List<Account> selectMyAccountStatement = accountService.selectMyAccountStatement(member.getMember_id());
            return ResponseEntity.ok(selectMyAccountStatement);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/selectMyAccountMonthStatement")
    public ResponseEntity<List<Account>> selectMyAccountMonthStatement(HttpServletRequest request){
        try {
            HttpSession session = request.getSession(); // 세션 가져오기
            Member member = (Member)session.getAttribute("member");
            List<Account> selectMyAccountStatement = accountService.selectMyAccountMonthStatement(member.getMember_id());
            return ResponseEntity.ok(selectMyAccountStatement);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/calTravelGroupMemberNotification")
    public ResponseEntity<?> calTravelGroupMemberNotification(@RequestBody GroupMember groupMembers){
        try {
            GroupMember[] groupMember = groupMembers.getGroupMember();
            int amount = groupMembers.getAmount();
            int groupId = groupMembers.getGroup_id();
            int travel_id = groupMembers.getTravel_id();
            accountService.insertGroupMemberNotification(groupMember,amount,groupId,travel_id);
            return ResponseEntity.ok("알림 요청 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/selectNotification")
    public ResponseEntity<List<GroupMember>> selectNotification(HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            Member member =(Member)session.getAttribute("member");
            List<GroupMember> groupNotification = accountService.selectNotification(member.getMember_id());
            return ResponseEntity.ok(groupNotification);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/calExecution")
    public ResponseEntity<?> calExecution(@RequestBody Map<String, String> calData, HttpServletRequest request){
        System.out.println(calData);
        try {
            HttpSession session = request.getSession();
            Member member =(Member)session.getAttribute("member");
            accountService.calExecution(calData, member.getMember_id());
            return ResponseEntity.ok("정산 완료");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/selectGroupInfo")
    public ResponseEntity<List<GroupAccountDetail>> selectGroupInfo(String groupId){
        try {
            List<GroupAccountDetail> groupAccountDetail =accountService.selectGroupInfo(groupId);
            return ResponseEntity.ok(groupAccountDetail);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/updateGroupInfo")
    public ResponseEntity<?> updateGroupInfo(@RequestBody Map<String, String> data){
        try {
            String groupAccount = data.get("groupAccount");
            String groupDay = data.get("groupDay");
            String groupDues = data.get("groupDues");
            String groupAutopay = data.get("groupAutopay");
            String groupPassword = data.get("groupPassword");

            accountService.updateGroupInfo(groupAccount, groupDay, groupDues, groupAutopay, groupPassword);
            return ResponseEntity.ok("그룹 수정 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/selectGroupAutopay")
    public ResponseEntity<String> selectGroupAutopay(String groupId){
        try {
            String autoPay = accountService.selectGroupAutopay(groupId);
            autoPay = autoPay.trim();
            if(autoPay.equals("N")){
                accountService.updateGroupAutopay(groupId);
            }
            return ResponseEntity.ok(autoPay);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("/deleteGroupAutopay")
    public ResponseEntity<String> deleteGroupAutopay(String groupId){
        try {
            accountService.deleteGroupAutopay(groupId);
            return ResponseEntity.ok("자동이체 해지가 되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }


    @PostMapping("/insertHanaAccount")
    public ResponseEntity<String> insertHanaAccount(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            accountService.insertHanaAccount(member.getMember_id(),member.getPhone());
            return ResponseEntity.ok("계좌등록 완료");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
