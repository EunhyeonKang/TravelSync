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
    List<ScheduleSet>  handleTrafficData(String title);
    List<TravelInfo> selectTop3Travel();
    List<TravelInfo> selectCategoryTravel(int page, int itemsPerPage, String categoryName);
    List<TravelInfo> selectAllTravel(int page, int itemsPerPage);
    boolean toggleLikeTraveling(Long itemId, boolean isLiked);
    void insertSchedule(Schedule schedule);

    void insertScheduleTotalAmount(Schedule schedule);
}