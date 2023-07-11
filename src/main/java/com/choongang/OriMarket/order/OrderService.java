package com.choongang.OriMarket.order;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.net.URI;

@Service
@Slf4j
public class OrderService {

    private final OrderRepository orderRepository;
    private final HttpSession session;

    @Autowired
    public OrderService(OrderRepository orderRepository, HttpSession session) {
        this.orderRepository = orderRepository;
        this.session = session;
    }

    static final String cid = "TC0ONETIME";
    static final String admin_key = "${e584b59b9f572556fbac3673883cb029}";
    private Order order;

    public Order kakaoPayReady() {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK" + "e584b59b9f572556fbac3673883cb029");
        headers.add("Accept", org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", org.springframework.http.MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", cid);
        params.add("partner_order_id", String.valueOf(order.getOrderNumber()));
        params.add("partner_user_id", order.getOrderUserId());
        params.add("total_amount", String.valueOf(order.getOrderTotalPrice()));
        params.add("vat_amount", null);
        params.add("approval_url", "https://localhost:8080/order_delivery");
        params.add("cancel_url", "https://localhost:8080/order_paymentpage");
        params.add("fail_url", "https://localhost:8080/cart");

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

        order = restTemplate.postForObject(
                "https://kapi.kakao.com/v1/payment/ready",
                requestEntity,
                KakaoReadyResponse.class);
        return order;
    }
}
