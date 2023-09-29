package com.hanacard.transitpay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    @GetMapping("/categoryTravel")
    public String categoryTravel() throws Exception {
        return "/travelplans/categoryTravel";
    }

    /***
     *  금융거래 기능
     */
    @GetMapping("/currencyhanam")
    public String currencyhanam() throws Exception {
        return "/hana/currencyhanam";
    }
    @GetMapping("/deposit")
    public String deposit() throws Exception {
        return "/hana/deposit";
    }
    @GetMapping("/transfer")
    public String transfer() throws Exception{
        return "/hana/accountTransfer";
    }
    @GetMapping("/account")
    public String account() throws Exception {
        return "/hana/account";
    }

    @GetMapping("/accountJoinForm")
    public String accountJoinForm() throws Exception {
        return "/hana/accountJoinForm";
    }
    @GetMapping("/calTravel")
    public String calTravel() throws Exception{
        return "/hana/calTravel";
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

    @GetMapping("/accountDetail")
    public String accountDetaul() throws Exception {
        return "/user/accountDetail";
    }
    @GetMapping("/saveTravel")
    public String saveTravel() throws Exception{
        return "/user/saveTravel";
    }
    @GetMapping("/calculateTravel")
    public String calculateTravel() throws Exception{
        return "/user/calculateTravel";
    }

    @GetMapping("/groupList")
    public String groupList() throws Exception{
        return "/user/groupList";
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

    @GetMapping("/mygroup/{groupId}")
    public String mygroup(@PathVariable int groupId, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        session.setAttribute("groupId",groupId);
        return "/group/mygroup";
    }

    @GetMapping("/groupStatement")
    public String groupStatement() throws Exception {
        return "/group/groupStatement";
    }
    /***
     *  채팅 기능
     */
    @GetMapping("/socket")
    public String socket() throws Exception {
        return "socket";
    }

}