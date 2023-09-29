package com.hanacard.transitpay.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
        private int member_id;
        private String email;
        private String name;
        private String phone;
        private String join_date;
        private String kakao_img;
        private long kakao_id;
        private int groupId;

}
