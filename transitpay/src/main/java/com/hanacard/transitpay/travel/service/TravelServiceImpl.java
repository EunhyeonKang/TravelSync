package com.hanacard.transitpay.travel.service;

import com.hanacard.transitpay.member.model.dto.GroupMember;
import com.hanacard.transitpay.travel.model.dao.TravelRepository;
import com.hanacard.transitpay.travel.model.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class TravelServiceImpl implements TravelService {
    private TravelRepository travelRepository;

    @Autowired
    public TravelServiceImpl(TravelRepository travelRepository) {
        this.travelRepository = travelRepository;
    }

    @Override
    public List<TravelInfo> handleSearchRequest(String searchText,String travelPlaces) {
        List<Map<String, String>> travelTwoList = new ArrayList<>();
        List<String> travelOneList = new ArrayList<>();
        TravelInfo ti = new TravelInfo();
        try {
            String[] parts = travelPlaces.split(",");
            for (String place : parts){
                String[] p = place.split(" ");
                if (p.length >= 2) {
                    Map<String, String> travelInfoMap = new HashMap<>();
                    travelInfoMap.put("place1", p[0]);
                    travelInfoMap.put("place2", p[1]);
                    travelTwoList.add(travelInfoMap);
                }
                else {
                    travelOneList.add(travelPlaces);
                }
            }
            ti.setTravelPlaces(travelTwoList);
            ti.setSearchText(searchText);
            ti.setTravelPlace(travelOneList);

            return travelRepository.handleSearchRequest(ti);
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception for debugging
            return Collections.emptyList(); // Ret
        }// urn an empty list on error
    }

    @Override
    public TravelInfo getItemDetailsById(int itemId) {
        try {
            return travelRepository.getItemDetailsById(itemId);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<TravelInfo> selectPlaceSearch(String searchText) {
        try {
            return travelRepository.selectPlaceSearch(searchText);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    @Transactional
    public void insertTravelAndGetId(Travel travel) {
        travelRepository.insertTravelAndGetId(travel);
    }

    @Override
    public List<ScheduleSet> handleTrafficData(String title) {
        return travelRepository.handleTrafficData(title);
    }

    @Override
    public List<TravelInfo> selectTop3Travel() {
        return travelRepository.selectTop3Travel();
    }

    @Override
    public List<TravelInfo> selectCategoryTravel(int page, int itemsPerPage,String categoryName) {
        int startRow = (page - 1) * itemsPerPage + 1;
        int endRow = startRow + itemsPerPage - 1;
        return travelRepository.selectCostEffectiveTravel(startRow, endRow, categoryName);
    }

    @Override
    public List<TravelInfo> selectAllTravel(int page, int itemsPerPage) {
        int startRow = (page - 1) * itemsPerPage + 1;
        int endRow = startRow + itemsPerPage - 1;
        return travelRepository.selectAllTravel(startRow,endRow);
    }

    @Override
    public boolean toggleLikeTraveling(Long itemId, boolean isLiked) {
        TravelInfo travelInfo = travelRepository.selectTravelInfoById(itemId);
        if (travelInfo != null) {
            int currentLikeCount = travelInfo.getLikeCount();
            travelInfo.setLikeCount(isLiked ? currentLikeCount-1 : currentLikeCount + 1);
            travelRepository.updateLikeCount(travelInfo);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public void insertSchedule(Schedule schedule) {
        travelRepository.insertSchedule(schedule);
    }

    @Override
    @Transactional
    public void insertScheduleTotalAmount(Schedule schedule) {
        travelRepository.insertScheduleTotalAmount(schedule);
    }

    @Override
    public int selectSchedule(int groupId,String travelTitle) {
        return travelRepository.selectSchedule(groupId,travelTitle);
    }

    @Override
    public List<MyGroupTravelInfo> selectMygroupTravelList(int memberId) {
        return travelRepository.selectMygroupTravelList(memberId);
    }

    @Override
    public List<Schedule> selectMygroupSchedule(int travelId) {
        return travelRepository.selectMygroupSchedule(travelId);
    }

    @Override
    public void insertBookmarkTraveling(Long itemId, int memberId) {
        travelRepository.insertBookmarkTraveling(itemId,memberId);
    }

    @Override
    public List<TravelInfo> selectBookmarkTravelList(int memberId) {
        return travelRepository.selectBookmarkTravelList(memberId);
    }

    @Override
    public List<MyGroupTravelInfo> selectTravelNoti(int memberId,int travelId,int groupId) {
        return travelRepository.selectTravelNoti(memberId,travelId,groupId);
    }

    @Override
    public List<GroupMember> selectNoti(String groupId) {
        return travelRepository.selectNoti(groupId);
    }

    @Override
    public int selectSheduleAmount(int travelId) {
        return travelRepository.selectSheduleAmount(travelId);
    }
    @Override
    public Schedule selectNotificationHistoryTravel(int travelId){
        return travelRepository.selectNotificationHistoryTravel(travelId);
    }

    @Override
    public List<GroupMember> complateBalanceAccounts(int travelId) {
        return travelRepository.complateBalanceAccounts(travelId);
    }

    @Override
    public List<Schedule> selectMemberNotificationHistory(int memberId) {
        return travelRepository.selectMemberNotificationHistory(memberId);
    }

    @Override
    public int completeCalculateTravel(int memberId) {
        return travelRepository.completeCalculateTravel(memberId);
    }
}