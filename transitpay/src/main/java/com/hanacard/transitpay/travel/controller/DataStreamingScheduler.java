package com.hanacard.transitpay.travel.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class DataStreamingScheduler {

    private final RealTimeDataService realTimeDataService;

    public DataStreamingScheduler(RealTimeDataService realTimeDataService) {
        this.realTimeDataService = realTimeDataService;
    }

    @Scheduled(fixedRate = 3000) // 30초마다 실행
    public void streamRealTimeData() {
        System.out.println("123");
        realTimeDataService.streamExchangeRate();
    }
}