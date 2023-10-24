package com.hanacard.transitpay.travel.subway;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Vector;

public class SubwayInfo {
    @Value("${odsay.key}")
    private String okey;
    public Vector<Integer> codestore;
    public Vector<Integer> check;
    public boolean sopt; // 최단거리 최소환승 부분임
    public void SubwayInfo() {
        this.codestore = new Vector<Integer>();
        this.check = new Vector<Integer>();
        this.sopt = true;
    }
    public void findcode() throws Exception {
        // 이 부분은 userinfo의 코드를 받아오면 그 코드의 전역, 다음역의 코드를 api를 이용해서 json으로 받아오는 것
        // userinfo의 첫번째 행의 이름으로 code 검색
        JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject = (JSONObject) jsonparser.parse(readUrl());
        JSONObject json = (JSONObject) jsonobject.get("result");
        JSONObject json2 = (JSONObject) json.get("prevOBJ");// 전역
        JSONObject json3 = (JSONObject) json.get("nextOBJ");// 다음역
        JSONArray array = (JSONArray) json2.get("station");// 전역의 정보들
        JSONArray array2 = (JSONArray) json3.get("station");// 다음역의 정보들

        System.out.print(json + "," +json2 + ","+ json3);//전역이랑 다음역 코드보기
        // 여기서 또 새로운 함수를 호출해야함 - 어떤 함수냐하면 새롭게 코드스토어에 담긴 코드들에 해당하는 지하철이 환승역인지 아닌지 알아내서
        // 환승역이면 다른 호선에 해당하는 코드를 담아야함
        // 지금 머릿속에 드는 생각은 코드스토어에 새롭게 담긴 코드두개에 대해서 subwaynogada에 있는 디비에서 이름을 뽑고, 또 그 이름에
        // 해당하는 나머지 코드가 잇는지를 검사하는거지
        // 애초에 저기 담을 때 중복 검사를 하기 때문에 일단 한번 시도해보자,,,,

        // System.out.print(codestore.get(0) + "," +codestore.get(1));//전역이랑 다음역 코드보기
    }
    private String readUrl() throws Exception {
        BufferedReader reader = null;

        try {
            URL url = new URL("https://api.odsay.com/v1/api/subwayStationInfo?lang=0&" + "stationID=130"+ "&apiKey="+okey);

            reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            StringBuffer buffer = new StringBuffer();

            String str;

            while ((str = reader.readLine()) != null) {
                buffer.append(str);
            }

            return buffer.toString();
        } finally {
            if (reader != null)
                reader.close();
        }
    }
    private String readUrl2(int commonSet) throws Exception {
        BufferedReader reader = null;

        try {
            int tempFlag = 0;
            if (this.sopt == false)
                tempFlag = 1;
            else
                tempFlag = 2;

            URL url = new URL("https://api.odsay.com/v1/api/subwayPath?lang=0&CID=1000&SID=" + 201
                    + "&EID=" + commonSet + "&Sopt=" + tempFlag
                    + "&apiKey=PvNe2k0NSnk5nUfZuvIT+A");
            // WcVpRfZ6U%2BAuKf8AgOTZapx9edixkIvmJLWnT9KgiaE-하이드아웃
            // 15XH4EhsIQGTKIwZAjii5dwtmXtv%2BdVulD4QWniB%2Bjg-친구집1
            // 9loymI1RM20ytIKmWKFe0x8arsNpYKoPSgHLoGhzANE-친구집2
            // FKNgHXbbPDpB2qoqgvkmA3DAKApfxjOfbp%2Fz%2F0gWnOU-학교
            reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));


            StringBuffer buffer = new StringBuffer();

            String str;

            while ((str = reader.readLine()) != null) {
                buffer.append(str);
            }

            return buffer.toString();
        } finally {
            if (reader != null)
                reader.close();
        }
    }
}