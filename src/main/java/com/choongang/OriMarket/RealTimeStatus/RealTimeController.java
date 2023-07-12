package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class RealTimeController {

    private final OrderService orderService;
    private final RealTimeService realTimeService;

    @Autowired
    public RealTimeController(OrderService orderService,RealTimeService realTimeService){
        this.orderService = orderService;
        this.realTimeService = realTimeService;
    }

    @GetMapping("/accept")
    public String orderAccept(HttpSession session){

            if(realTimeService.update1(session)){
                return "order/order_delivery";
            }
            return "order/order_delivery";

    }
}
