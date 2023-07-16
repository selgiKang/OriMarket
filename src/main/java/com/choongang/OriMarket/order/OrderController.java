
package com.choongang.OriMarket.order;

import com.choongang.OriMarket.RealTimeStatus.RealTimeService;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class OrderController {


    private final OrderService orderService;
    private final RealTimeService realTimeService;

    //7.16 테스트 승엽
    private final OrderRepository orderRepository;


    @Autowired
    public OrderController(OrderService orderService,RealTimeService realTimeService, OrderRepository orderRepository){
        this.orderService = orderService;
        this.realTimeService = realTimeService;

        //7.16 테스트 승엽
        this.orderRepository = orderRepository;

    }


    @GetMapping("/calculate")
    public String calculate(){return "calculate/calculate";}

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


    //7.16 테스트 승엽
    @GetMapping("/order-list")
    public String getOrderList(Model model) {
        List<Order> orders = orderRepository.findAll();
        model.addAttribute("orders", orders);

        return "order_list";
    }

    @PostMapping("/order_paymentPage")
    public String orderDelivery(@ModelAttribute Order order, @ModelAttribute RealTimeStatus rts, HttpSession session, @RequestParam("orderNumber")String orderNumberStr, Model model){

        order.setOrderNumber(orderNumberStr);
        session.setAttribute("orderNumber",orderNumberStr);
        //주문 db에 주문내역 저장
        if(orderService.orderDelivery(order,session)){

            //배달 내역에 set
            rts.setOrderNumber(order);
            rts.setRtsOrderIng(0);
            rts.setRtsRiderIng(0);
            rts.setRtsRiderFinish(0);
            
            //배달 내역 db에 저장
            if (realTimeService.insertRts(rts)){
                model.addAttribute("rtsOrderIng",rts.getRtsOrderIng());
                System.out.println(rts.getRtsOrderIng());
                return "order/order_delivery";
            }else{
                return "order/order_paymentPage";
            }
        }else{
            return "order/order_paymentPage";
        }
    }

    @PostMapping("/calculate")
    @ResponseBody
    public ResponseEntity<List<Map<String,String>>> calculateRequest(@RequestParam("calculate_date") String calculateDate, @RequestParam("calculate_date_last") String calculateDateLast){
        List<Map<String,String>> tableDate = orderService.getTableData(calculateDate,calculateDateLast);

        return ResponseEntity.ok(tableDate);
    }

//    @PostMapping("/calculate")
//    public String calculateResult(@ModelAttribute Order order,@RequestParam("orderNumber")String orderNumberStr){
//
//        return "calculate/calculate";
//    }



//순번     order_Num : pk auto_intended
//시퀀스 - 시행횟수    시퀀스넘
}

