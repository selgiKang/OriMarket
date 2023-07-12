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
    public String orderAccept(@ModelAttribute Order order, @ModelAttribute RealTimeStatus rts, Model model){


            rts.setRtsOrderIng(1);
            rts.setRtsRiderIng(0);
            rts.setRtsRiderFinish(0);

            if(realTimeService.insertRts(rts)){
                model.addAttribute("rtsOrderIng",rts.getRtsOrderIng());
                return "order/order_delivery";
            }
            return "order/order_delivery";

    }
}
