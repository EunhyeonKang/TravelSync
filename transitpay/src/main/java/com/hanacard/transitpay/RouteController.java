package com.hanacard.transitpay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
class RouteController {
    @GetMapping("/")
    public String index() throws Exception {
        return "index";
    }
    /***
     *  간편 로그인 기능
     */
    @GetMapping("/join")
    public String join() throws Exception {
        return "join";
    }
    @GetMapping("/login")
    public String login() throws Exception {
        return "login";
    }

    /***
     *  여행계획 기능
     */
    @GetMapping("/travel")
    public String travel() throws Exception {
        return "/travelplans/travel";
    }

    @GetMapping("/map")
    public String map() throws Exception {
        return "/travelplans/map";
    }

    @GetMapping("/traffic")
    public String traffic() throws Exception {
        return "/travelplans/traffic";
    }

    @GetMapping("/top3Travel")
    public String top3Travel() throws Exception {
        return "/travelplans/top3Travel";
    }

    /***
     *  환전 기능(x)
     */
    @GetMapping("/currencyhanam")
    public String currencyhanam() throws Exception {
        return "/hana/currencyhanam";
    }
    @GetMapping("/conaccount")
    public String conaccount() throws Exception {
        return "/hana/conaccount";
    }

    /***
     *  마이페이지 기능
     */
    @GetMapping("/mypage")
    public String mypage() throws Exception {
        return "/user/mypage";
    }

    @GetMapping("/editMember")
    public String editMember() throws Exception {
        return "/user/editMember";
    }
    /***
     *  모임통장 기능
     */
    @GetMapping("/group")
    public String groupAgreement() throws Exception {
        return "/group/agreement";
    }
    @GetMapping("/groupAccountDetail")
    public String groupAccountDetail() throws Exception {
        return "/group/groupAccountDetail";
    }
    @GetMapping("/openedAccount")
    public String openedAccount() throws Exception {
        return "/group/openedAccount";
    }
    @GetMapping("/groupInvite")
    public String groupInvite() throws Exception {
        return "/group/groupInvite";
    }

    @GetMapping("/mygroup")
    public String mygroup() throws Exception {
        return "/group/mygroup";
    }

}