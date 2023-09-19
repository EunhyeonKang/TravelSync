package com.hanacard.transitpay.travel.controller;

import com.hanacard.transitpay.member.controller.AccountController;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@ServerEndpoint("/websocket")
public class TravelSocketHandler extends TextWebSocketHandler {

    private static HttpURLConnection connection;
    private static final Set<WebSocketSession> sessions = new HashSet<>();
    private static final Map<String,WebSocketSession> sessionMap = new HashMap<>();
    private static final HashMap<String, String> userMap = new HashMap<>();


    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    //사용자의 메시지를 받게되면 동작하는 메소드
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String msg = message.getPayload();
        logger.info("===============Message=================");
        logger.info("{}", msg);
        logger.info("===============Message=================");

        JSONObject obj = jsonToObjectParser(msg);
        //로그인된 Member (afterConnectionEstablished 메소드에서 session을 저장함)
        for(String key : sessionMap.keySet()) {
            WebSocketSession wss = sessionMap.get(key);

            if(userMap.get(wss.getId()) == null) {
                userMap.put(wss.getId(), (String)obj.get("userName"));
            }

            //클라이언트에게 메시지 전달
            wss.sendMessage(new TextMessage(obj.toJSONString()));
        }
    }
    //사용자가(브라우저) 웹소켓 서버에 붙게되면 동작하는 메서
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info("{} 연결되었습니다.", session.getId());
        super.afterConnectionEstablished(session);
        sessionMap.put(session.getId(), session);

        JSONObject obj = new JSONObject();
        obj.put("type", "getId");
        obj.put("sessionId", session.getId());

        //클라이언트에게 메시지 전달
        session.sendMessage(new TextMessage(obj.toJSONString()));
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        logger.info("{} 연결이 종료되었습니다.", session.getId());
        super.afterConnectionClosed(session, status);
        sessionMap.remove(session.getId());

        String userName = userMap.get(session.getId());
        for(String key : sessionMap.keySet()) {
            WebSocketSession wss = sessionMap.get(key);

            if(wss == session) continue;
            JSONObject obj = new JSONObject();
            obj.put("type", "close");
            obj.put("userName", userName);

            //클라이언트에게 메시지 전달
            wss.sendMessage(new TextMessage(obj.toJSONString()));
        }
        userMap.remove(session.getId());
    }
    private static JSONObject jsonToObjectParser(String jsonStr) {
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(jsonStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return obj;
    }
    public void sendRealTimeData(String data) {
        for (WebSocketSession session : sessions) {
            if (session.isOpen()) {
                try {
                    session.sendMessage(new TextMessage(data));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public static String getTravel() {
        return "ok";
    }

}
