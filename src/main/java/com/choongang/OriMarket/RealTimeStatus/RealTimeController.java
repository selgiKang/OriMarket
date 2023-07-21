package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class RealTimeController {

    private final OrderService orderService;
    private final RealTimeService realTimeService;

    private final RealTimeRepository rtsRepository;

    @Autowired
    public RealTimeController(OrderService orderService, RealTimeService realTimeService, RealTimeRepository rtsRepository){
        this.orderService = orderService;
        this.realTimeService = realTimeService;
        this.rtsRepository = rtsRepository;
    }

    @GetMapping("/accept")
    public String orderAccept(Order order, HttpSession session, Model model, RealTimeStatus rts){

        rts = realTimeService.update1(order, session);
        if(rts.getRtsOrderIng() == 1){
                    model.addAttribute("rtsOrderIng",rts.getRtsOrderIng());
                    return "order/order_delivery";
                }

            return "order/order_delivery";
    }
}
