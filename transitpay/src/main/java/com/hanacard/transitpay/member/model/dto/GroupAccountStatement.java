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
 * 모임통장 계좌 잔액
 */
public class GroupAccountStatement {
    private int member_id;
    private String name;
    private String phone;
    private String account_num;
    private int amount;
}

