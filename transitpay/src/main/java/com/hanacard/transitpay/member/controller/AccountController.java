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
            session.setAttribute("groupAccountDetail", groupAccountDetail);
            return ResponseEntity.ok("모임통장 개설 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("모임통장 개설 실패");
        }
    }

    @PostMapping("/selectGroupAccountInfo")
    public ResponseEntity<GroupAccountDetail> selectGroupAccountInfo(@RequestBody String memberId,HttpServletRequest request) {
        try {
            GroupAccountDetail groupAccountDetail = accountService.selectGroupAccountInfo(memberId);
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
            session.setAttribute("groupId",groupAccountInfo.getGroup_id());
            accountService.insertGroupMember("L",groupAccount.getGroup_leader(), groupAccountInfo.getGroup_id());
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
            String grouppwd = accountService.inputCheckPassword(groupId);
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
            accountService.insertGroupMember("M",member.getMember_id(), Integer.parseInt(groupId));
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
            System.out.println(depositData);
            accountService.updateAccountBalance(member.getMember_id(),depositData);
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/selectGroupAccountStatement")
    public ResponseEntity<List<GroupAccount>> selectGroupAccountStatement(HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            GroupAccountDetail groupAccount = (GroupAccountDetail)session.getAttribute("groupAccountDetail");
            System.out.println(groupAccount);
            List<GroupAccount> groupAccountList = accountService.selectGroupAccountStatement(groupAccount.getGroup_account());
            return ResponseEntity.ok(groupAccountList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("JoinGroupAccountAndMemberAccount")
    public ResponseEntity<Account> JoinGroupAccountAndMemberAccount(HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            Member member = (Member)session.getAttribute("member");
            Account groupAccountList = accountService.JoinGroupAccountAndMemberAccount(member.getMember_id());
            return ResponseEntity.ok(groupAccountList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @PostMapping("deleteGroups")
    public ResponseEntity<String> deleteGroups(String groupId,HttpServletRequest request){
        try {
            HttpSession session = request.getSession(); // 세션 가져오기
            session.removeAttribute("groupAccount");
            session.removeAttribute("GroupAccountDetail");
            accountService.deleteGroups(groupId);
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
}
