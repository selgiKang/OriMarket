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
import org.springframework.web.bind.annotation.PostMapping;

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

    @PostMapping("/accept")
    public String orderAccept(@ModelAttribute Order order,Model model,HttpSession session){

            if(realTimeService.update1(order,model,session)){
                return "order/order_delivery";
            }
            return "order/order_delivery";

    }
}
