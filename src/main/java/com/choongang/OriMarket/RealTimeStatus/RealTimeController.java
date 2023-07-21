package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
        if (rts.getRtsOrderIng() == 1) {
            model.addAttribute("rtsOrderIng", rts.getRtsOrderIng());
            return "order/order_delivery";
        }
        return "order/order_delivery";
    }

    @PostMapping("/complete")
    public String orderComplete(Order order, HttpSession session, Model model, RealTimeStatus rts) {
        rts = realTimeService.update2(order, session); // 주문 완료 버튼 눌렀을 때 rts_rider_finish 값을 1로 변경하고 저장
        model.addAttribute("rtsOrderIng", rts.getRtsOrderIng()); // 주문이 완료되어도 여전히 처리중 탭에서 해당 주문을 보여주기 위해 rtsOrderIng 값을 설정
        return "order/order_delivery";
    }

}
