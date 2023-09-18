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
}