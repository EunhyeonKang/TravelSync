package com.hanacard.transitpay.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
//@EnableScheduling
public class WebSocketConfig implements WebSocketConfigurer {

    @Bean
    public ExchangeRateWebSocketHandler exchangeRateWebSocketHandler() {
        return new ExchangeRateWebSocketHandler();
    }
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(exchangeRateWebSocketHandler(), "/exchange-rate");
    }
}