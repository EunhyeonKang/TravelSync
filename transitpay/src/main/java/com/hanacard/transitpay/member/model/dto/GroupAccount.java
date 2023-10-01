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
 * 모임
 */
public class GroupAccount {
    private int group_id;
    private String group_name;
    private String group_type;
    private String group_account;
    private char group_use;
    private String account_num;
    private int group_leader;
    private int group_pw;
    private String accountContent;

    /**
     * 자동이체
     * */
    private String phone;
    private int member_id;
    private String name;
    private int g_day;
    private int g_dues;
    private String account_bank;

    /**
     * 모임통장 계좌 거래내역
     * */
    private long group_account_tid;
    private String target_account_num;
    private String transaction_type;
    private int amount;
    private int balance;
    private String transaction_date;
    private String transaction_content;
}
