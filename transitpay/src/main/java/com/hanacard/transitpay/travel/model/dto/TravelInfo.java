package com.hanacard.transitpay.travel.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class TravelInfo {
    private int t_num;
    private String content;
    private String photo;
    private String location;
    private String tags;
    private String travel_type;
    private String date;

    private List<Map<String, String>> travelPlaces;
    private List<String> travelPlace;

    private String searchText;
    private int likeCount;
    private double starCount;
    private String foodImg;
    private String foodName;
    private String foodPrice;
}
