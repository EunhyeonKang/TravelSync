package com.hanacard.transitpay.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
        private int member_id;
        private String email;
        private String name;
        private String phoneNumber;
        private String join_date;
        private String vfc_state;
        private String agree_status;
        private String member_type;
}
