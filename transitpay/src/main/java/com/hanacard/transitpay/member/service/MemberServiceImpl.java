package com.hanacard.transitpay.member.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanacard.transitpay.member.model.dao.MemberRepository;
import com.hanacard.transitpay.member.model.dto.Member;
import com.hanacard.transitpay.member.model.dto.SocialToken;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
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
    public String  sendAuthenticationCode(String phone) {
        Message coolsms = new Message(apiKey, api_secret);
        String authenticationCode=createAuthenticationCode();
        HashMap<String , String> params= new HashMap<String,String>();
        params.put("to", phone);//누구에게
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



    @Override
    public String getKakaoToken(String code) {
        String access_token ="";
        try {
            URL url = new URL("https://kauth.kakao.com/oauth/token");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=" + "951e0627da48ee51855b252517b6352d");
            sb.append("&code=" + code);
            BufferedWriter bw = null;
            try {
                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
                bw.write(sb.toString());
            } catch (IOException e) {
                throw e;
            } finally {
                if (bw != null) bw.flush();
            }
            BufferedReader br = null;
            String line = "", result = "";
            try {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                while ((line = br.readLine()) != null) {
                    result += line;
                }
            } catch (IOException e) {
                throw e;
            } finally {
                if (br != null)
                    br.close();
            }
            ObjectMapper mapper = new ObjectMapper();
            access_token = mapper.readValue(result, SocialToken.class).getAccess_token();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_token;
    }

    @Override
    public Member getKakaoUserInfo(String access_token) {
        Member member = new Member();
        try{
            URL url = new URL("https://kapi.kakao.com/v2/user/me");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", "Bearer "+access_token);
            System.out.println(access_token);
            String line = "", result = "";
            line = ""; result = "";

            BufferedReader br = null;
            try (InputStream is = conn.getInputStream();
                 JsonReader jsonReader = Json.createReader(is)) {
                 JsonObject jsonObject = jsonReader.readObject();
                 System.out.println(jsonObject);
                 // JSON 데이터에서 원하는 값을 추출
                 long id = jsonObject.getJsonNumber("id").longValue();
                 String connectedAt = jsonObject.getString("connected_at");
                 String nickname = jsonObject.getJsonObject("properties").getString("nickname");
                 String profileImage = jsonObject.getJsonObject("properties").getString("profile_image");
                 String email = jsonObject.getJsonObject("kakao_account").getString("email");

                 member.setJoin_date(connectedAt);
                 member.setName(nickname);
                 member.setKakao_img(profileImage);
                 member.setKakao_id(id);
                 member.setEmail(email);
            }
//            KakaoMessageServiceImpl kakaoMessage = new KakaoMessageServiceImpl();
//            kakaoMessage.getKakaoMessageFriends(access_token);
//            SocialToken myMsg = new SocialToken();
//            myMsg.setBtnTitle("자세히보기");
//            myMsg.setMobileUrl("");
//            myMsg.setObjType("text");
//            myMsg.setWebUrl("");
//            myMsg.setText("메시지 테스트입니다.");
//            kakaoMessage.sendMessage(access_token, myMsg);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return member;
    }

    @Override
    @Transactional
    public void insertKakaoAndPhoneMember(Member member) {
        memberRepository.insertKakaoAndPhoneMember(member);
    }

    @Override
    public Member selectEmailOneMember(String email) {
        return memberRepository.selectEmailOneMember(email);
    }
}
