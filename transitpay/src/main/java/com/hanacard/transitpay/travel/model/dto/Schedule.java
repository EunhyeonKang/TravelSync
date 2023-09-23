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
public class Schedule {
    private String title;

    private String schedule_date;
    private String travel_title;
    private Double placeX;
    private Double placeY;
    private String schedule_place;
    private int pnum;
    private int price;
    private String category;
    private List<Schedule> placeDataList;

    private int food_expenses;
    private int accommodation_expenses;
    private int etc_expenses;

}
