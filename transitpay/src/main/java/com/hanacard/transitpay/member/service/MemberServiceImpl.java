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
import org.springframework.web.multipart.MultipartFile;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberRepository memberRepository;

    @Value("${coolsms.key}")
    private String apiKey;
    @Value("${coolsms.api_secret}")
    private String api_secret;
    @Autowired
    private SHA256Enc enc;

    private static final String CHARACTERS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final int CODE_LENGTH = 8;


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
    public String  sendAuthenticationCode(String phone,String name,int day,int amount) {
        Message coolsms = new Message(apiKey, api_secret);
        String authenticationCode=createAuthenticationCode();
        HashMap<String , String> params= new HashMap<String,String>();
        params.put("from", phone);
        params.put("to", "+82 1588-1111");
        params.put("type", "SMS");
        params.put("text", "[트래블싱크 모임통장 자동이체] "+name+ "님 모임통장에 매월 "+day+"일, "+amount+"원이 이체되었습니다.");
//        params.put("text", "트래블로그 가입 인증번호 "+authenticationCode+" 입니다");
        params.put("app_version", "jcmarket app 1.1");
        System.out.println(params);
        try {
            coolsms.send(params);
        } catch (CoolsmsException e) {
            e.printStackTrace();
        }

        return authenticationCode;
    }

    @Override
    public String sendAuthenticationCode(String phone,String groupName) {
        Message coolsms = new Message(apiKey, api_secret);
        String authenticationCode = createAuthenticationCode();
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("from", "01093660469");
        params.put("to", phone);
        params.put("type", "SMS");
        params.put("text", "[트래블싱크 모임통장 개설인증] " + groupName + "모임 인증 번호는 "+authenticationCode+"입니다.");
//        params.put("text", "트래블로그 가입 인증번호 "+authenticationCode+" 입니다");
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
        member.setCode(generateCustomCode());
        memberRepository.insertKakaoAndPhoneMember(member);
    }

    @Override
    public Member selectEmailOneMember(String email) {
        return memberRepository.selectEmailOneMember(email);
    }

    @Override
    public List<Member> selectAllGroupMembers(int groupId) {
        return memberRepository.selectAllGroupMembers(groupId);
    }

    @Override
    @Transactional
    public void joinMember(Member member, MultipartFile[] files, String savePath) throws Exception {
        if (member.getPw() != null) {
            String passwd = member.getPw();
            String encPw = enc.encData(passwd);
            member.setPw(encPw);
        }
        member.setCode(generateCustomCode());
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
        String formattedDate = dateFormat.format(currentDate);
        member.setJoin_date(formattedDate);
        if (files[0].isEmpty()) {

        } else {
            for (MultipartFile file : files) {
                String filename = file.getOriginalFilename();
                String onlyFilename = filename.substring(0, filename.indexOf("."));
                String extention = filename.substring(filename.indexOf("."));
                String filepath = null;
                int count = 0;
                while (true) {
                    if (count == 0) {
                        filepath = onlyFilename + extention;
                    } else {
                        filepath = onlyFilename + "_" + count + extention;
                    }
                    File checkFile = new File(savePath + filepath);
                    if (!checkFile.exists()) {
                        break;
                    }
                    count++;
                }
                member.setKakao_img(filepath);
//                System.out.println("savepath : " + savePath);
//                System.out.println("filepath : " + filepath);
                try {
                    FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
                    BufferedOutputStream bos = new BufferedOutputStream(fos);
                    byte[] bytes = file.getBytes();
                    bos.write(bytes);
                    bos.close();
                } catch (FileNotFoundException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        memberRepository.joinMember(member);
        if(member.getRecode()!=null){
            memberRepository.updateRecommendCode(member.getRecode(),member.getEmail());
        }
    }

    @Override
    public Member loginMember(String email, String pw) throws Exception {
        String inputPwHash = enc.encData(pw);
        return memberRepository.loginMember(email,inputPwHash);
    }

    @Override
    public void updateInviteAccept(String code, int memberId) {
        memberRepository.updateInviteAccept(code,memberId);
    }


    public String generateCustomCode() {
        SecureRandom random = new SecureRandom();
        StringBuilder code = new StringBuilder(CODE_LENGTH);

        for (int i = 0; i < CODE_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            code.append(randomChar);
        }

        return code.toString();
    }

}
