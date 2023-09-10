package com.hanacard.transitpay.member.service;

import com.hanacard.transitpay.member.model.dao.MemberRepository;
import com.hanacard.transitpay.member.model.dto.Member;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Random;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberRepository memberRepository;

    @Value("${coolsms.key}")
    private String apiKey;
    @Value("${coolsms.api_secret}")
    private String api_secret;


    @Autowired
    public MemberServiceImpl(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public String createAuthenticationCode() {
        String authenticationCode ="";
        Random randNumber = new Random();
        int codeLength=6;
        for(int i =0;i<codeLength ; i++) {
            String randCode = Integer.toString(randNumber.nextInt(10));
            authenticationCode+=randCode;
        }
        return authenticationCode;
    }

    @Override
    public String  sendAuthenticationCode(String phoneNumber) {
        Message coolsms = new Message(apiKey, api_secret);
        String authenticationCode=createAuthenticationCode();
        HashMap<String , String> params= new HashMap<String,String>();
        params.put("to", phoneNumber);//누구에게
        params.put("from","01093660469");//누가 보낼것인지
        params.put("type", "SMS");
        params.put("text", "트래블로그 가입 인증번호 "+authenticationCode+" 입니다");
        params.put("app_version", "jcmarket app 1.1");

        try {
            coolsms.send(params);
        } catch (CoolsmsException e) {
            e.printStackTrace();
        }

        return authenticationCode;
    }

    @Override
    public Member selectOneMember(String phoneNumber) {
        try {
            return memberRepository.selectOneMember(phoneNumber);
        } catch (Exception e) {
            return null;
        }
    }

}
