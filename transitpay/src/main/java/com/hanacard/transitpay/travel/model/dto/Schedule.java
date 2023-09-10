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
    private String scheduleDate;
    private String travelTitle;

    private Double placeX;
    private Double placeY;

    private List<Schedule> placeDataList;

}
