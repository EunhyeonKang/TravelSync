package com.hanacard.transitpay.travel.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;



@NoArgsConstructor
@Data
public class ScheduleSet {
    private String title;
    private int scheduleId;
    private String scheduleDate;
    private String travelTitle;
    private String travelTitle1;
    private Double startPlaceX;
    private Double startPlaceY;
    private Double endPlaceX;
    private Double endPlaceY;

    public ScheduleSet(String title,String scheduleDate, String travelTitle,String travelTitle1, Double startPlaceX, Double startPlaceY, Double endPlaceX, Double endPlaceY) {
        this.title = title;
        this.scheduleDate=scheduleDate;
        this.travelTitle = travelTitle;
        this.travelTitle1 = travelTitle1;
        this.startPlaceX = startPlaceX;
        this.startPlaceY = startPlaceY;
        this.endPlaceX = endPlaceX;
        this.endPlaceY = endPlaceY;
    }
}
