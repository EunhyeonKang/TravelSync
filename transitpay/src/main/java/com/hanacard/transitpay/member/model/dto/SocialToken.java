package com.hanacard.transitpay.member.model.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class SocialToken {
    private String access_token;
    private String token_type;
    private String refresh_token;
    private Integer expires_in;
    private String scope;
    private Integer refresh_token_expires_in;
    private String objType;
    private String text;
    private String webUrl;
    private String mobileUrl;
    private String btnTitle;
}