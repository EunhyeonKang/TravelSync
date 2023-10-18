package com.hanacard.transitpay.member.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanacard.transitpay.member.model.dto.SocialToken;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

@Service
public class KakaoMessageServiceImpl extends HttpCallService{
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private static final String MSG_SEND_SERVICE_URL = "https://kapi.kakao.com/v2/api/talk/memo/default/send";
    private static final String SEND_SUCCESS_MSG = "메시지 전송에 성공했습니다.";
    private static final String SEND_FAIL_MSG = "메시지 전송에 실패했습니다.";
    private static final String SUCCESS_CODE = "0"; //kakao api에서 return해주는 success code 값

    public boolean sendMessage(String accessToken, SocialToken msgDto) {

        JSONObject linkObj = new JSONObject();
        linkObj.put("web_url", msgDto.getWebUrl());
        linkObj.put("mobile_web_url", msgDto.getMobileUrl());

        JSONObject templateObj = new JSONObject();
        templateObj.put("object_type", msgDto.getObjType());
        templateObj.put("text", msgDto.getText());
        templateObj.put("link", linkObj);
        templateObj.put("button_title", msgDto.getBtnTitle());


        HttpHeaders header = new HttpHeaders();
        header.set("Content-Type", APP_TYPE_URL_ENCODED);
        header.set("Authorization", "Bearer " + accessToken);

        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("template_object", templateObj.toString());

        HttpEntity<?> messageRequestEntity = httpClientEntity(header, parameters);

        String resultCode = "";
        ResponseEntity<String> response = httpRequest(MSG_SEND_SERVICE_URL, HttpMethod.POST, messageRequestEntity);
        System.out.println(response);
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            Map<String, Object> jsonData = null;
            jsonData = objectMapper.readValue(response.getBody(), Map.class);
            resultCode = jsonData.get("result_code").toString();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }


        return successCheck(resultCode);
    }
    public boolean successCheck(String resultCode) {
        if(resultCode.equals(SUCCESS_CODE)) {
            logger.info(SEND_SUCCESS_MSG);
            return true;
        }else {
            logger.debug(SEND_FAIL_MSG);
            return false;
        }

    }

    public void getKakaoMessageFriends(String accessToken) {
        try {
            URL url = new URL("https://kapi.kakao.com/v1/api/talk/friends");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", "Bearer "+accessToken);
            String line = "", result = "";
            line = ""; result = "";

            BufferedReader br = null;
            try (InputStream is = conn.getInputStream();
                 JsonReader jsonReader = Json.createReader(is)) {
                JsonObject jsonObject = jsonReader.readObject();
                // JSON 데이터에서 원하는 값을 추출
                System.out.println(jsonObject);
            }
        } catch (IOException e) {
            e.printStackTrace();
            // IOException 처리: 파일 읽기/쓰기 오류 등
        } catch (RestClientException e) {
            e.printStackTrace();
            // RestClientException 처리: HTTP 요청 오류 등
        } catch (Exception e) {
            e.printStackTrace();
            // 그 외 예외 처리
        }
    }
}
