package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.manager.user.ManagerService;
import com.choongang.OriMarket.manager.user.ManagerUser;
import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.Manager;
import org.jboss.jandex.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class RealTimeController {

    private final OrderService orderService;
    private final RealTimeService realTimeService;
    private final ManagerService managerService;

    private final RealTimeRepository rtsRepository;

    @Autowired
    public RealTimeController(OrderService orderService, RealTimeService realTimeService, RealTimeRepository rtsRepository,ManagerService managerService){
        this.orderService = orderService;
        this.realTimeService = realTimeService;
        this.rtsRepository = rtsRepository;
        this.managerService  = managerService;
    }

/*    @GetMapping("/accept")
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
    }*/

    //주문 수락
    @GetMapping("/accept")
    public String orderAccept(Order order, HttpSession session, ManagerUser managerUser, Model model, RealTimeStatus rts){

       String managerId= session.getAttribute("managerId").toString();

        //매니저 정보 가져오기
        ManagerUser userResult = managerService.findByManagerId(managerId,model,session);
        model.addAttribute("userResult",userResult);

        //매니저가 소속된 시장의 주문만 리스트에 저장
        List<Order> orderList = (List<Order>) model.getAttribute("managerOrderList");
        model.addAttribute("orderList",orderList);
        System.out.println("주문 목록: "+orderList.get(0).getOrderNumber());

        //불러온 주문의 상태 검색
        List<RealTimeStatus> rtsList = new ArrayList<>();
        Order finalOrder = new Order();

        if(orderList!=null && !orderList.isEmpty()){

            //주문 목록 출력해서
            for(Order orders: orderList){
                //해당 주문번호의
                String orderNumber = orders.getOrderNumber();
                finalOrder.setOrderNumber(orderNumber);

                //그 주문번호의 상태를 찾아서
                RealTimeStatus rtsResult = rtsRepository.findByorderNumber(finalOrder);
                System.out.println("rts상태"+rtsResult.getRtsOrderIng());
                if(rtsResult!=null){
                    //넣는다.
                    rtsList.add(rtsResult);
                }
            }
        }
        model.addAttribute("rtsResult",rtsList);


        // 주문 번호 보냄
        rts = realTimeService.update1(order, session);
        if(rts.getRtsOrderIng() == 1 && rts.getRtsRiderIng()==0 && rts.getRtsRiderFinish()==0){
            model.addAttribute("rtsOrderIng",rts.getRtsOrderIng());
            model.addAttribute("rtsRiderIng",rts.getRtsRiderIng());
            model.addAttribute("rtsRiderFinish",rts.getRtsRiderFinish());
            return "manager/order_list";
        }

        return "manager/order_list";
    }

    //픽업 완료 - 라이더한테 가도록
    @GetMapping("/acceptPickup")
    public String acceptPickup(Order order, HttpSession session, Model model, RealTimeStatus rts){

        List<Order> orderList = (List<Order>) model.getAttribute("managerOrderList");
        model.addAttribute("orderList",orderList);
        System.out.println("주문 목록: "+orderList.get(0).getOrderNumber());

        //불러온 주문의 상태 검색
        List<RealTimeStatus> rtsList = new ArrayList<>();
        Order finalOrder = new Order();

        if(orderList!=null && !orderList.isEmpty()){

            //주문 목록 출력해서
            for(Order orders: orderList){
                //해당 주문번호의
                String orderNumber = orders.getOrderNumber();
                finalOrder.setOrderNumber(orderNumber);

                //그 주문번호의 상태를 찾아서
                RealTimeStatus rtsResult = rtsRepository.findByorderNumber(finalOrder);
                System.out.println("rts상태"+rtsResult.getRtsOrderIng());
                if(rtsResult!=null){
                    //넣는다.
                    rtsList.add(rtsResult);
                }
            }
        }
        model.addAttribute("rtsResult",rtsList);

        // 주문 번호 보냄
        rts = realTimeService.update2(order, session);
        if(rts.getRtsOrderIng() == 1 && rts.getRtsRiderIng()==1 && rts.getRtsRiderFinish()==0){
            model.addAttribute("rtsOrderIng",rts.getRtsOrderIng());
            model.addAttribute("rtsRiderIng",rts.getRtsRiderIng());
            model.addAttribute("rtsRiderFinish",rts.getRtsRiderFinish());
            return "manager/order_list";
        }

        return "manager/order_list";
    }

    @GetMapping("/acceptFinish")
    public String acceptFinish(Order order, HttpSession session, Model model, RealTimeStatus rts){

        // 주문 번호 보냄
        rts = realTimeService.update2(order, session);
        if(rts.getRtsOrderIng() == 1 && rts.getRtsRiderIng()==1 && rts.getRtsRiderFinish()==1){
            model.addAttribute("rtsOrderIng",rts.getRtsOrderIng());
            model.addAttribute("rtsRiderIng",rts.getRtsRiderIng());
            model.addAttribute("rtsRiderFinish",rts.getRtsRiderFinish());
            return "manager/order_list";
        }

        return "manager/order_list";
    }



}
