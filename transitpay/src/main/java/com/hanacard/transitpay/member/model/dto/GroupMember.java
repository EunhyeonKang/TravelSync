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
 * 모임통장 멤버
 */
public class GroupMember {
    private int group_member_id;
    private String group_member_type;
    private int member_id;
    private int group_id;
    private int pw_state;
    private int amount;
    private GroupMember[] groupMember;
    private String kakao_img;
    private String name;
    private int travel_id;
    private int interest;
}
