package com.hanacard.transitpay.travel.service;

import com.hanacard.transitpay.member.model.dto.GroupMember;
import com.hanacard.transitpay.travel.model.dto.*;

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
    int selectSchedule(int groupId,String travelTitle);
    List<MyGroupTravelInfo> selectMygroupTravelList(int memberId);
    List<Schedule> selectMygroupSchedule(int travelId);
    void insertBookmarkTraveling(Long itemId,int memberId);
    List<TravelInfo> selectBookmarkTravelList(int memberId);
    List<MyGroupTravelInfo> selectTravelNoti(int memberId);
    List<GroupMember> selectNoti(String groupId);

    int selectSheduleAmount(int travelId);

    Schedule selectNotificationHistoryTravel(int travelId);

    List<GroupMember> complateBalanceAccounts(int travelId);

    List<Schedule> selectMemberNotificationHistory(int memberId);
}