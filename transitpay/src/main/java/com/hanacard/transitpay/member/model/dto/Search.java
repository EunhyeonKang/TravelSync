package com.hanacard.transitpay.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Search {
    private int search_history_id;
    private String search_keyword;
    private String search_date;
    private String search_type;
    private int member_id;
    private int search_count;
    private String search_month;
}
