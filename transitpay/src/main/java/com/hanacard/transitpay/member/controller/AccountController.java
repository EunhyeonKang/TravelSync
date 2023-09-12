package com.hanacard.transitpay.member.controller;

import com.hanacard.transitpay.member.model.dto.Account;
import com.hanacard.transitpay.member.model.dto.GroupAccount;
import com.hanacard.transitpay.member.model.dto.GroupAccountDetail;
import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.member.service.AccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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

    @PostMapping(value = "/selectBackAccount")
    public ResponseEntity<List<Account>> selectBackAccount(HttpServletRequest request) {
        HttpSession session = request.getSession();
        try {
            Member member = (Member) session.getAttribute("member");
            List<Account> account = accountService.selectBackAccount(member.getMember_id());
            return ResponseEntity.ok(account);
        } catch (Exception e) {
            // 예외 처리 로직
            return (ResponseEntity<List<Account>>) ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping(value = "/updateMainAccount")
    public ResponseEntity<String> updateMainAccount(@RequestBody List<Integer> accountIdList) {
        try {
            accountService.updateMainAccount(accountIdList);
            return ResponseEntity.ok("계좌 변경 성공");
        } catch (Exception e) {
            // 예외 처리 로직
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("계좌 변경 실패");
        }
    }

    @PostMapping(value = "/selectAmountMember")
    public ResponseEntity<Integer> selectAmountMember(@RequestBody String memberId) {

        try {
            GroupAccountDetail balance = accountService.selectAmountMember(memberId);
            return ResponseEntity.ok(balance.getG_balance());
        } catch (Exception e) {
            return (ResponseEntity<Integer>) ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping(value = "insertGroupAccount")
    public ResponseEntity<String> insertGroupAccount(GroupAccount groupAccount, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            session.setAttribute("accountNum", groupAccount.getAccount_num());
            accountService.insertGroupAccount(groupAccount);
            return ResponseEntity.ok("모임통장 개설 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("모임통장 개설 실패");
        }
    }

    @PostMapping("/insertGroupDetail")
    public ResponseEntity<String> insertGroupDetail(@RequestBody Map<String, String> groupData) {
        try {
            logger.info("Received formData: {}", groupData);
            accountService.insertGroupDetail(groupData);
            return ResponseEntity.ok("모임통장 개설 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("모임통장 개설 실패");
        }
    }

    @PostMapping("/selectGroupAccountInfo")
    public ResponseEntity<GroupAccountDetail> selectGroupAccountInfo(@RequestBody String memberId) {
        try {
            GroupAccountDetail groupAccountDetail = accountService.selectGroupAccountInfo(memberId);
            return ResponseEntity.ok(groupAccountDetail);
        } catch (Exception e) {
            return (ResponseEntity<GroupAccountDetail>) ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/selectVirtureAccountNumber")
    public ResponseEntity<String> selectVirtureAccountNumber(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String account_Num = (String) session.getAttribute("accountNum");
            String virtureAccountNumber = accountService.selectVirtureAccountNumber(account_Num);
            return ResponseEntity.ok(virtureAccountNumber);
        } catch (Exception e) {
            return (ResponseEntity<String>) ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @PostMapping(value = "/selectUseTypeAccount")
    public ResponseEntity<GroupAccount> selectUseTypeAccount(String memberId) {
        try {
            GroupAccount groupAccount = accountService.selectUseTypeAccount(memberId);
            return ResponseEntity.ok(groupAccount);
        } catch (Exception e) {
            return (ResponseEntity<GroupAccount>) ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
