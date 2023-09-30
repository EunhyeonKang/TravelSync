package com.hanacard.transitpay.travel.model.dto;

import lombok.Data;

@Data
public class ChatMessage {
    private String sessionId;
    private String userName;
    private String msg;
}
