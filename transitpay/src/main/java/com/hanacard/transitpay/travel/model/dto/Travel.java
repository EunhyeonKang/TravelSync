package com.hanacard.transitpay.travel.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Travel     {
    private int travelId;
    private String travelTitle;
    private String travelStart;
    private String travelEnd;
    private List<String> travelPlaceList;
    private String travelPlaceJson;
    private int daysLeft;
    private int dDay;
    private int memberId;

}
