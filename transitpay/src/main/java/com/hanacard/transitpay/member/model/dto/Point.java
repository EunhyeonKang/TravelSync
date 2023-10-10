package com.hanacard.transitpay.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Point {
    private int poi_id;
    private int member_id;
    private String poi_datetime;
    private String poi_content;
    private int poi_point;
    private String poi_type;
}
