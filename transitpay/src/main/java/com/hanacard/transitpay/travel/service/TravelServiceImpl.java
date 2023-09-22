package com.hanacard.transitpay.travel.service;

import com.hanacard.transitpay.travel.model.dao.TravelRepository;
import com.hanacard.transitpay.travel.model.dto.Schedule;
import com.hanacard.transitpay.travel.model.dto.ScheduleSet;
import com.hanacard.transitpay.travel.model.dto.Travel;
import com.hanacard.transitpay.travel.model.dto.TravelInfo;
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
                // 인천 남동구 or 서울 마포구
                if (p.length >= 2) {
                    Map<String, String> travelInfoMap = new HashMap<>();
                    travelInfoMap.put("place1", p[0]);
                    travelInfoMap.put("place2", p[1]);
                    travelTwoList.add(travelInfoMap);
                }// 인천 or 서울 or 경기도
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
    @Transactional
    public void insertScheduleSets(List<Schedule> scheduleList) {
        Collections.sort(scheduleList, Comparator.comparing(Schedule::getScheduleDate));
        List<ScheduleSet> scheduleSets = new ArrayList<>();
        Schedule prevSchedule = null;

        for (Schedule item : scheduleList) {
            if (prevSchedule == null) {
                prevSchedule = item;
            } else {
                if (prevSchedule.getScheduleDate().equals(item.getScheduleDate())) {
                    // 같은 날짜인 경우 세트 생성
                    ScheduleSet scheduleSet = new ScheduleSet(
                            item.getTitle(),
                            item.getScheduleDate(),
                            prevSchedule.getTravelTitle(),
                            item.getTravelTitle(),
                            prevSchedule.getPlaceX(),
                            prevSchedule.getPlaceY(),
                            item.getPlaceX(),
                            item.getPlaceY()
                    );
                    scheduleSets.add(scheduleSet);
                    prevSchedule = null;
                } else {
                    prevSchedule = item;
                }
            }
        }
        for (ScheduleSet set : scheduleSets) {
            travelRepository.insertScheduleSets(set);
        }
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
}