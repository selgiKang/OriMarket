package com.choongang.OriMarket.order;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class OrderController {

    @Autowired
    private final OrderService orderService;

    @GetMapping("/order")
    public String order(){return "order/order_paymentPage";}


}
