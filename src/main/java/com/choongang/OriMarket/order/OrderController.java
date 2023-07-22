
package com.choongang.OriMarket.order;

import com.choongang.OriMarket.RealTimeStatus.RealTimeRepository;
import com.choongang.OriMarket.RealTimeStatus.RealTimeService;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.user.CartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class OrderController {


    private final OrderService orderService;
    private final RealTimeService realTimeService;
    private final CartService cartService;




    @Autowired
    public OrderController(OrderService orderService, RealTimeService realTimeService, OrderRepository orderRepository, CartService cartService){
        this.orderService = orderService;
        this.realTimeService = realTimeService;
        this.cartService = cartService;
    }

    @GetMapping("/test2")
    public String test(){return "business/businessmain";}

    //정산내역
    //calculate get으로 갈 때는 businessmain 코드처럼 해야함! 보고 그 코드 복붙하기!
    @GetMapping("/calculate")
    public String calculateRequest2(@RequestParam("calculate_date") String calculateDate,
                                    @RequestParam("calculate_date_last") String calculateDateLast,
                                    Model model,HttpSession session){
        List<Map<String,String>> tableData = orderService.getTableData(calculateDate,calculateDateLast,model,session);
        System.out.println("getCalculate"+calculateDate+"/"+calculateDateLast);
        int totalCome = 0;
        int orderCount = tableData.size();
        for(Map<String,String>data : tableData){
            totalCome += Integer.parseInt(data.get("amount"));
        }

        model.addAttribute("tableData",tableData);
        model.addAttribute("totalCome",totalCome);
        model.addAttribute("orderCount",orderCount);

        return "calculate/calculate";
    }

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

    //7.18 테스트 데이터 가져오는거까지 성공 승엽
    @GetMapping("/order/order_list")
    public String getOrderList(Model model) {
        List<Order> orderList = orderService.getAllOrders();
        model.addAttribute("orders", orderList);
        return "order/order_list";
    }



    @PostMapping("/order_paymentPage/{userId}")
    public String orderDelivery(@ModelAttribute Order order, @ModelAttribute RealTimeStatus rts, HttpSession session, @RequestParam("orderNumber")String orderNumberStr,@PathVariable("userId")String userId, Model model) {
        order.setOrderNumber(orderNumberStr);

        //주문번호
        session.setAttribute("orderNumber", orderNumberStr);

        //시장 번호 등록
        cartService.cartPayment(userId);
        cartService.cartDeleteAll(userId,session);      // 여기서 시장 번호 받기

        Market m = new Market();
        Long marketSeq = Long.valueOf((session.getAttribute("marketSeq")).toString());
        m.setMarketSeq(marketSeq);
        order.setMarketSeq(m);

        // 주문 db에 주문 내역 저장
        if (orderService.orderDelivery(order, session)) {

            // 배달 내역에 set
            rts.setOrderNumber(order);
            rts.setRtsOrderIng(0); // "OrderIng" 상태로 설정
            rts.setRtsRiderIng(0);
            rts.setRtsRiderFinish(0);

            // 배달 내역 db에 저장
            if (realTimeService.insertRts(rts)) {
                RealTimeStatus rResult = realTimeService.findRts(order,session);
                if(rResult!=null){
                    model.addAttribute("rtsOrderIng",rResult.getRtsOrderIng());
                }
                model.addAttribute("orderDelivery", order); // order_delivery 페이지로 개별 주문의 상세 내역 전달
                model.addAttribute("orderList", orderService.getAllOrders()); // order_list 페이지로 주문 목록 전달

                //시장으로 바꾸기!
                //모든 주문 리스트
                List<Order> allOrders = orderService.getAllOrders();

                //order_list 출력
                for(Order allOrderList: allOrders){

                    //주문 받은 리스트 전부 가져옴
                    //모든 rts 리스트
                    List<RealTimeStatus> allList = realTimeService.getAllRtsList(allOrderList.getOrderNumber());
                    System.out.println("주문번호 오니? "+allOrderList.getOrderNumber());
                    List<RealTimeStatus> firstStatus = new ArrayList<>();
                    List<RealTimeStatus> ingResult = new ArrayList<>();
                    List<RealTimeStatus> riderIng = new ArrayList<>();
                    List<RealTimeStatus> finishResult = new ArrayList<>();

                    if(!allList.isEmpty()){
                        for(RealTimeStatus allListResult : allList){
                            //주문 리스트 중 배송중이 1이면
                            if(allListResult.getRtsOrderIng()==0 && allListResult.getRtsRiderIng()==0 && allListResult.getRtsRiderFinish()==0){
                                System.out.println(allListResult.getOrderNumber());
                                System.out.println(allListResult.getRtsOrderIng());
                                firstStatus.add(allListResult);
                            }
                            if(allListResult.getRtsOrderIng()==1 && allListResult.getRtsRiderIng()==0 && allListResult.getRtsRiderFinish()==0){
                                ingResult.add(allListResult);
                            }else if(allListResult.getRtsOrderIng()==1 && allListResult.getRtsRiderIng()==1 && allListResult.getRtsRiderFinish()==0){
                                riderIng.add(allListResult);
                            }else{
                                finishResult.add(allListResult);
                            }
                        }
                        //주문
                        model.addAttribute("firstStatus",firstStatus);
                        //주문 시작
                        model.addAttribute("ingResult",ingResult);
                        //배달중
                        model.addAttribute("riderIng",riderIng);
                        //배달 완료
                        model.addAttribute("finishResult",finishResult);
                    }
                }


                RealTimeStatus rtsSearchResult = realTimeService.findRts(order,session);
                System.out.println(rts.getRtsOrderIng());

                return "store/order_list";
            } else {
                return "order/order_paymentPage";
            }
        } else {
            return "order/order_paymentPage";
        }
    }


    //정산내역
    @PostMapping("/calculate")
    @ResponseBody
    public ResponseEntity<List<Map<String,String>>> calculateRequest(@RequestParam("calculate_date") String calculateDate,
                                                                     @RequestParam("calculate_date_last") String calculateDateLast,
                                                                     HttpSession session, Model model){
        List<Map<String,String>> tableDate = orderService.getTableData(calculateDate,calculateDateLast,model,session);

        return ResponseEntity.ok(tableDate);
    }


//순번     order_Num : pk auto_intended
//시퀀스 - 시행횟수    시퀀스넘
}

