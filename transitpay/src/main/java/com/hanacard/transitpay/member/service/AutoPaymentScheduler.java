package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dto.GroupAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.List;

@Configurable
@EnableScheduling
//@Component
public class AutoPaymentScheduler {
    @Autowired
    private AccountService accountService;
    @Autowired
    private MemberService memberService;
    @Autowired
    public AutoPaymentScheduler(AccountService accountService,MemberService memberService) {
        this.accountService = accountService;
        this.memberService = memberService;
    }

    //    @Scheduled(cron = "0 0 #{T(java.lang.Integer).valueOf(paymentDayOfMonth)} * * ?")
//    @Scheduled(fixedRate = 30000) // 30초마다 실행
    public void executeAutoPayment() {
        System.out.println("스케줄러 실행");
        // 자동이체신청한 사람의 핸드폰번호, 회비일자, 회비금액, 회원이름 조회
        List<GroupAccount> groupInfoOfDayOfMonthList = accountService.getAutoPhoneOfPaymentDayOfMonth();
        for(GroupAccount ga : groupInfoOfDayOfMonthList){
            //문자 발송
//            memberService.sendAuthenticationCode(ga.getPhone(),ga.getName(),ga.getG_day(),ga.getG_dues());
            //자동이체 실행
            accountService.executeAutoPayment(ga);
            return;
        }
    }

}