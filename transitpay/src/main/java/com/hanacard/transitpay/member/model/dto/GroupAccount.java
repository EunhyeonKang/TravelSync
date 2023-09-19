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
     * 모임통장 계좌 거래내역
     * */
    private int account_tid;
    private String target_account_num;
    private String transaction_type;
    private int amount;
    private String transaction_date;
    private String transaction_content;
}
