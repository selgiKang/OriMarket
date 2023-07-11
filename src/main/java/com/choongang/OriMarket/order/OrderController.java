package com.choongang.OriMarket.order;

import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class OrderController {

    @Autowired
    private final OrderService orderService;

    @GetMapping("/order_delivery")
    public String order(){return "order/order_delivery";}
    @GetMapping("/order_paymentPage")
    public String orderPaymentPage(){return "order/order_paymentPage";}
    @GetMapping("/order_receipt")
    public String orderReceipt(){

        return "order/order_receipt";
    }
    @GetMapping("/order_pastorder")
    public String orderPastorder(){return "order/order_pastorder";}




}
