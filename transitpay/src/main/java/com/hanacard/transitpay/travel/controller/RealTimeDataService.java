package com.hanacard.transitpay.travel.controller;

import org.springframework.stereotype.Service;

@Service
public class RealTimeDataService {
    private final TravelSocketHandler webSocketHandler;
    public RealTimeDataService(TravelSocketHandler webSocketHandler) {
        this.webSocketHandler = webSocketHandler;
    }
    public void streamExchangeRate() {
        String travel = webSocketHandler.getTravel();
        webSocketHandler.sendRealTimeData(travel);
    }
}