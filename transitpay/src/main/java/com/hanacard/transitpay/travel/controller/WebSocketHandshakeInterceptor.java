package com.hanacard.transitpay.travel.controller;

import com.hanacard.transitpay.member.model.dto.Member;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Component
public class WebSocketHandshakeInterceptor implements HandshakeInterceptor {
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;

            // HttpSession을 얻기 위해 HttpServletRequest에서 HttpSession을 가져옵니다.
            HttpSession httpSession = servletRequest.getServletRequest().getSession();

            // HttpSession에 저장된 Member 객체 또는 다른 속성을 가져옵니다.
            Member member = (Member) httpSession.getAttribute("member");
            // 가져온 Member 객체를 WebSocket 핸들러로 전달합니다.
            attributes.put("member", member);
        }

        return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
        // 사용하지 않음
    }
}
