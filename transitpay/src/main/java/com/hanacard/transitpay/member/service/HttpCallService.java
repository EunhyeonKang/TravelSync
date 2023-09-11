package com.hanacard.transitpay.member.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

public class HttpCallService {
    protected static final String APP_TYPE_URL_ENCODED = "application/x-www-form-urlencoded;charset=UTF-8";
    protected static final String APP_TYPE_JSON = "application/json;charset=UTF-8";

    public HttpEntity<?> httpClientEntity(HttpHeaders header, Object params) {
        HttpHeaders requestHeaders = header;

        if (params == null || "".equals(params))
            return new HttpEntity<>(requestHeaders);
        else
            return new HttpEntity<>(params, requestHeaders);
    }
    public ResponseEntity<String> httpRequest(String url, HttpMethod method, HttpEntity<?> entity){
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.exchange(url, method, entity,String.class);
    }
    public ResponseEntity<String> httpRequest(URI url, HttpMethod method, HttpEntity<?> entity){
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.exchange(url, method, entity,String.class);
    }
}
