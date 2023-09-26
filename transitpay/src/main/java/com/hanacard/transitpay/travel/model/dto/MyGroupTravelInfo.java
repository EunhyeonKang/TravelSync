package com.hanacard.transitpay.travel.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyGroupTravelInfo {
    /**
     * 내 모임여행 정보
     * */
    private int travelId;
    private String travelTitle;
    private String travelStart;
    private String travelEnd;
    private String travelPlace;
    private int dDay;
    private int groupId;
    private String groupName;
    private String groupType;
    private String groupAccount;
    private int groupUse;
    private String accountNum;
    private int groupLeader;
    private String groupMemberType;
    private int pwState;
    /**
     * 내 모임여행 상세 정보
     * */

}