package com.hanacard.transitpay.travel.service;

import com.hanacard.transitpay.travel.model.dto.Schedule;
import com.hanacard.transitpay.travel.model.dto.ScheduleSet;
import com.hanacard.transitpay.travel.model.dto.Travel;
import com.hanacard.transitpay.travel.model.dto.TravelInfo;

import java.util.List;

public interface  TravelService {
    List<TravelInfo> handleSearchRequest(String searchText,String travelPlaces);
    TravelInfo getItemDetailsById(int itemId);
    List<TravelInfo> selectPlaceSearch(String searchText);
    void insertTravelAndGetId(Travel travel);
    void insertScheduleSets(List<Schedule> scheduleList);
    List<ScheduleSet>  handleTrafficData(String title);
}