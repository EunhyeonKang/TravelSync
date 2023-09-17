package com.hanacard.transitpay.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Account {
    private int account_id;
    private String account_num;
    private Integer balance;
    private String account_bank;
    private int account_pwd;
    private String account_main;
    private String account_phone;
    private String account_use;
    private List<Integer> accountIdList;
}
