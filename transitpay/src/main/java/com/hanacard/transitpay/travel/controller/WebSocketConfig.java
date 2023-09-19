package com.hanacard.transitpay.travel.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
//어떠한 요청에 대해서 서버가 응답할지를 결정하는 설정파일을 작성
public class WebSocketConfig implements WebSocketConfigurer {
    @Bean
    public TravelSocketHandler travelSocketHandler() {
        return new TravelSocketHandler();
    }
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(travelSocketHandler(), "/websocket");
    }
}
