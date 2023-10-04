package com.hanacard.transitpay.travel.model.dao;

import com.hanacard.transitpay.member.model.dto.GroupMember;
import com.hanacard.transitpay.travel.model.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TravelRepository {
    List<TravelInfo> handleSearchRequest(TravelInfo ti);
    TravelInfo getItemDetailsById(int itemId);
    List<TravelInfo> selectPlaceSearch(String searchText);
    void insertTravelAndGetId(Travel travel);
    List<ScheduleSet> handleTrafficData(String title);
    List<TravelInfo> selectTop3Travel();
    List<TravelInfo> selectCostEffectiveTravel(@Param("startRow") int startRow,
                                               @Param("endRow") int endRow,
                                               @Param("categoryName") String categoryName);
    List<TravelInfo> selectAllTravel(@Param("startRow") int startRow,
                                     @Param("endRow") int endRow);

    TravelInfo selectTravelInfoById(Long itemId);
    void updateLikeCount(TravelInfo travelInfo);
    void insertSchedule(Schedule schedule);
    void insertScheduleTotalAmount(Schedule schedule);
    int selectSchedule(int groupId,String travelTitle);
    List<MyGroupTravelInfo> selectMygroupTravelList(int memberId);
    List<Schedule> selectMygroupSchedule(int travelId);
    void insertBookmarkTraveling(Long itemId,int memberId);
    List<TravelInfo> selectBookmarkTravelList(int memberId);
    List<MyGroupTravelInfo> selectTravelNoti(int memberId,int travelId,int groupId);
    List<GroupMember> selectNoti(String groupId);
    int selectSheduleAmount(int travelId);
    Schedule selectNotificationHistoryTravel(int travelId);
    List<GroupMember> complateBalanceAccounts(int travelId);
    List<Schedule> selectMemberNotificationHistory(int memberId);
    int completeCalculateTravel(int memberId);
}
