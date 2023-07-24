package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

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
    @ResponseBody // AJAX 요청에 응답 데이터를 JSON 형태로 반환
    public Map<String, Object> orderAccept(@RequestParam("orderNumber") String orderNumber, HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        // 주문 번호를 이용하여 주문 수락 처리
        Order order = orderService.getOrderNumberList(orderNumber);
        RealTimeStatus rts = realTimeService.update1(order, session);

        // 수락 처리 결과에 따라 응답 데이터 설정
        if (rts.getRtsOrderIng() == 1) {
            response.put("success", true);
            response.put("message", "주문이 수락되었습니다.");
        } else {
            response.put("success", false);
            response.put("message", "주문 수락 처리에 실패했습니다.");
        }

        return response;
    }

/*    @GetMapping("/accept")
    public String orderAccept(Order order, HttpSession session, Model model, RealTimeStatus rts){

        // 주문 번호 보냄
        rts = realTimeService.update1(order, session);
        if(rts.getRtsOrderIng() == 1){
            model.addAttribute("rtsOrderIng",rts.getRtsOrderIng());
            return "manager/order_list";
       }

       return "manager/order_list";
    }*/

}
