package com.hanacard.transitpay.travel.model.dao;

import com.hanacard.transitpay.travel.model.dto.ScheduleSet;
import com.hanacard.transitpay.travel.model.dto.Travel;
import com.hanacard.transitpay.travel.model.dto.TravelInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TravelRepository {
    List<TravelInfo> handleSearchRequest(TravelInfo ti);
    TravelInfo getItemDetailsById(int itemId);
    List<TravelInfo> selectPlaceSearch(String searchText);
    void insertTravelAndGetId(Travel travel);
    void insertScheduleSets(ScheduleSet scheduleSets);
    List<ScheduleSet> handleTrafficData(String title);
    List<TravelInfo> selectTop3Travel();
    List<TravelInfo> selectCostEffectiveTravel(@Param("startRow") int startRow,
                                               @Param("endRow") int endRow,
                                               @Param("categoryName") String categoryName);
    List<TravelInfo> selectAllTravel(@Param("startRow") int startRow,
                                     @Param("endRow") int endRow);
}
