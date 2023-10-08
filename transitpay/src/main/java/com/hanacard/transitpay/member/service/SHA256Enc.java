package com.hanacard.transitpay.member.service;

import org.springframework.stereotype.Component;

import java.security.MessageDigest;

@Component
public class SHA256Enc {
    public String encData(String data) throws Exception {
        //Spring Security의 MessageDigest객체를 이용한 암호화
        MessageDigest mDigest = MessageDigest.getInstance("SHA-256");//SHA-256 알고리즘 사용

        //매개변수로 받은 값을 byte배열로 변환하여 mDigent에 저장
        mDigest.update(data.getBytes());

        //SHA256으로 변환완료
        //변환된 데이터를 byte배열로 꺼냄
        byte[] msgStr = mDigest.digest();

        //byte -128 ~ 127 까지 표현 가능
        // 0 ~ 255까지 표현하도록 변경작업
        StringBuffer sb = new StringBuffer();
        for(int i=0;i<msgStr.length;i++) {
            byte tmp = msgStr[i];
            String tmpText = Integer.toString((tmp & 0xff)+0x100,16).substring(1);
            sb.append(tmpText);
        }
        return sb.toString();
    }
}