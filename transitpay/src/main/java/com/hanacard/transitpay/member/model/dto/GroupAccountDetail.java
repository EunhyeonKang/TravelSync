package com.hanacard.transitpay.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
/**
 * 모임통장 계좌
 */
public class GroupAccountDetail {
    private int group_id;
    private int g_account_id;
    private String group_account;
    private int g_balance;
    private String g_month;
    private int g_day;
    private int g_dues;
    private String g_date;
    private String g_autopay;
    private String account_num;
    private String account_bank;
}
