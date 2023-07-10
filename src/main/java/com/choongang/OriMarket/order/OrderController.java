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

    @GetMapping("/order_delivery")
    public String order(){return "order/order_delivery";}
    @GetMapping("/order_paymentPage")
    public String order_paymentPage(){return "order/order_paymentPage";}
    @GetMapping("/order_receipt")
    public String order_receipt(){return "order/order_receipt";}


}
