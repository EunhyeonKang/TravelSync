package com.hanacard.transitpay.util;

import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class RealTimeDataService {

    private final ExchangeRateWebSocketHandler webSocketHandler;

    public RealTimeDataService(ExchangeRateWebSocketHandler webSocketHandler) {
        this.webSocketHandler = webSocketHandler;
    }

    public void streamExchangeRate() {
        BigDecimal exchangeRate = webSocketHandler.getExchangeRate();
        String exchangeRateData = "USD 환율 : " + exchangeRate.toString();
        webSocketHandler.sendRealTimeData(exchangeRateData);
    }
}