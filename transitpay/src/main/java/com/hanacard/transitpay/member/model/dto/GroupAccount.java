package com.hanacard.transitpay.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class GroupAccount {
    private int group_id;
    private String group_name;
    private String group_type;
    private String group_account;
    private String account_num;
}
