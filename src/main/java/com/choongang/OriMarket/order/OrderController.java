
package com.choongang.OriMarket.order;

import com.choongang.OriMarket.RealTimeStatus.RealTimeService;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.user.CartService;
import com.choongang.OriMarket.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class OrderController {


    private final OrderService orderService;
    private final RealTimeService realTimeService;
    private final CartService cartService;

    private final  NewOrderRepository newOrderRepository;

    private final NewOrderDetailRepository newOrderDetailRepository;

    private final ItemRepository itemRepository;


    @Autowired
    public OrderController(OrderService orderService, RealTimeService realTimeService, OrderRepository orderRepository, CartService cartService, NewOrderRepository newOrderRepository, NewOrderDetailRepository newOrderDetailRepository, ItemRepository itemRepository){
        this.orderService = orderService;
        this.realTimeService = realTimeService;
        this.cartService = cartService;
        this.newOrderRepository = newOrderRepository;
        this.newOrderDetailRepository = newOrderDetailRepository;
        this.itemRepository = itemRepository;
    }

    //정산내역
    //calculate get으로 갈 때는 businessmain 코드처럼 해야함! 보고 그 코드 복붙하기!
    @GetMapping("/calculate")
    public String calculateRequest2(@RequestParam("calculate_date") String calculateDateStr,
                                    @RequestParam("calculate_date_last") String calculateDateLastStr,
                                    Model model,HttpSession session){

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
        LocalDateTime calculateDate = LocalDateTime.parse(calculateDateStr, formatter);
        LocalDateTime calculateDateLast = LocalDateTime.parse(calculateDateLastStr, formatter);

        List<Map<String,String>> tableData = orderService.getTableData(calculateDate,calculateDateLast,model,session);
        System.out.println("getCalculate"+calculateDate+"/"+calculateDateLast);
        int totalCome = 0;
        int orderCount = tableData.size();
        int allTotalPrice = 0;

        for(Map<String,String>data : tableData){
            //orders 테이블에 물건 여러개 들어가면 가격 ,표시를 빼고 더애서 가져옴
            totalCome += orderService.sumCommaSeparatedNumbers(data.get("amount"));
            allTotalPrice += Integer.parseInt(data.get("totalPrice"));
        }

        model.addAttribute("tableData",tableData);
        model.addAttribute("totalCome",totalCome);
        model.addAttribute("orderCount",orderCount);
        model.addAttribute("allTotalPrice",allTotalPrice);

        return "calculate/calculate";
    }

    @GetMapping("/sellerList")
    public String sellerList(@RequestParam("calculate_date") String calculateDateStr,
                                    @RequestParam("calculate_date_last") String calculateDateLastStr,
                                    Model model,HttpSession session){
        //날짜 데이터로 형변환해서
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
        LocalDateTime calculateDate = LocalDateTime.parse(calculateDateStr, formatter);
        LocalDateTime calculateDateLast = LocalDateTime.parse(calculateDateLastStr, formatter);

        List<Map<String,String>> tableData = orderService.getTableData(calculateDate,calculateDateLast,model,session);

        System.out.println("getCalculate"+calculateDate+"/"+calculateDateLast);

        int totalCome = 0;
        int orderCount = tableData.size();
        String totalPrice=null;

        for(Map<String,String>data : tableData){
            //orders 테이블에 물건 여러개 들어가면 가격 ,표시를 빼고 더해서 가져옴
            totalCome += orderService.sumCommaSeparatedNumbers(data.get("amount"));
            totalPrice = data.get("totalPrice");
        }

        model.addAttribute("tableData",tableData);
        model.addAttribute("totalCome",totalCome);
        model.addAttribute("orderCount",orderCount);

        return "business/seller_list";
    }

    @GetMapping("/order_delivery")
    public String order(){return "order/order_delivery";}
    @GetMapping("/order_paymentPage")
    public String orderPaymentPage(){return "order/order_paymentPage";}
    @GetMapping("/order_pastorder")
    public String orderPastorder(User user,HttpSession session,Model model,NewOrderDetail newOrderDetail){
        if(session.getAttribute("userId")==null){
            return "error/login_error";
        }else {
            //아이디로
            Long userSeq = Long.valueOf((session.getAttribute("userSeq")).toString());
            user.setUserSeq(userSeq);
            //지난 모든 주문들 출력
            List<NewOrder> pastOrderList = newOrderRepository.findByUser(user);
            model.addAttribute("pastOrderList", pastOrderList);
            return "order/order_pastorder";
        }
    }


    @GetMapping("/order/order_list")
    public String getOrderList(Model model) {
        List<Order> orderList = orderService.getAllOrders();
        model.addAttribute("orders", orderList);

        //log.info("Number of orders retrieved: {}", orderList.size());


        return "order/order_list";
    }

    //특정 날짜 정보
    @GetMapping("/details")
    public String showDetailsPage(@RequestParam("date") String date, Model model,HttpSession session) {
        // 날짜 정보를 서비스로 전달하여 해당 날짜의 정보를 가져온다.

        // detailsService의 메서드 이름과 내용은 프로젝트의 요구사항에 맞게 작성해야 합니다.
        List<NewOrder> detailsDataList = orderService.getDetailsByDate(date,session);
        Long buUserNumber = Long.valueOf(session.getAttribute("buUserNumber").toString());

        for(NewOrder detailsOrder:detailsDataList){
            for(NewOrderDetail nod: detailsOrder.getNewOrderDetails()){
                if(nod.getBuStoreNumber().equals(buUserNumber)){
                    model.addAttribute("detailsDataList", detailsDataList);
                    // 가져온 정보를 뷰에 전달한다.
                }
            }
        }

        return "calculate/detailsCalculate"; // details.jsp 또는 해당하는 뷰 페이지의 이름
    }

    @GetMapping("/order_receiptDelivery")
    public String pastOrderDetailList(@RequestParam("orderNumber")String orderNumber,HttpSession session,Model model){

        NewOrder resultPastOrder = newOrderRepository.findByOrderNumber(orderNumber);
        model.addAttribute("newOrder",resultPastOrder);

        return "order/order_delivery";
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
            realTimeService.insertRts(rts);

            model.addAttribute("orderDelivery", order); // order_delivery 페이지로 개별 주문의 상세 내역 전달
            model.addAttribute("orderList", orderService.
                    getAllOrders()); // order_list 페이지로 주문 목록 전달

            //시장으로 바꾸기!
            //모든 주문 리스트
            List<Order> allOrders = orderService.getAllOrders();
            //주문 번호 비교해서 그 주문 내역만 꺼냄
            Order onlyUserNowOrder = orderService.getOrderNumberList(orderNumberStr);


        }

         //저장된 rts 테이블에서 order (주문번호) 비교해서 찾기
        RealTimeStatus rResult = realTimeService.findRts(order,session);
        if(rResult!=null) {
            model.addAttribute("rtsOrderIng", rResult.getRtsOrderIng());
            model.addAttribute("rtsRiderIng", rResult.getRtsRiderIng());
            model.addAttribute("rtsRiderFinish", rResult.getRtsRiderFinish());
        }
        RealTimeStatus rtsSearchResult = realTimeService.findRts(order,session);
        System.out.println(rts.getRtsOrderIng());

        return "order/order_delivery";
    }

    @PostMapping("/order_paymentPage1/{userId}")
    public String orderDelivery1(@ModelAttribute NewOrder newOrder,HttpSession session,@PathVariable("userId")String userId, Model model, User user) {
        System.out.println("시장이름?"+newOrder.getOrderMarketName());
        user.setUserSeq(Long.valueOf((session.getAttribute("userSeq")).toString()));
        newOrder.setUser(user);
        NewOrder save = newOrderRepository.save(newOrder);
        // 아이템 아이디로 아이템찾기
        String itemId1 = save.getItemId1();
        String[] itemIdsArray = itemId1.split(",");

        String orderGoodsNum = save.getOrderGoodsNum();
        String[] itemcount = orderGoodsNum.split(",");

        List<Item> items = new ArrayList<>();
        for (String itemId : itemIdsArray) {
                    items.add(itemRepository.findById(Long.valueOf(itemId)).orElseThrow());
                }
        for (int i=0;i<items.size();i++){
            NewOrderDetail newOrderDetail = new NewOrderDetail();
            newOrderDetail.setItemName(items.get(i).getItemName());
            newOrderDetail.setItemPrice(String.valueOf(items.get(i).getItemPrice()));
            newOrderDetail.setBuStoreName(items.get(i).getBusinessStore().getBuStoreName());
            newOrderDetail.setBuStoreNumber(String.valueOf(items.get(i).getBusinessStore().getBusinessUser().getBuUserNumber()));
            newOrderDetail.setItemCount(itemcount[i]);
            newOrderDetail.setNewOrder(save);
            newOrderDetail.setOrderNumber(save.getOrderNumber());
            newOrderDetailRepository.save(newOrderDetail);
        }
        List<NewOrderDetail> byOrderNumber = newOrderDetailRepository.findByOrderNumber(save.getOrderNumber());
        save.setNewOrderDetails(byOrderNumber);
        newOrderRepository.save(save);

        cartService.cartPayment(userId);
        cartService.cartDeleteAll(userId,session);

        model.addAttribute("newOrder",save);

        return "order/order_delivery";
    }



    //정산내역
    @PostMapping("/calculate")
    @ResponseBody
    public ResponseEntity<List<Map<String,String>>> calculateRequest(@RequestParam("calculate_date") String calculateDateStr,
                                                                     @RequestParam("calculate_date_last") String calculateDateLastStr,
                                                                     HttpSession session, Model model){
        //날짜 데이터로 형변환해서
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
        LocalDateTime calculateDate = LocalDateTime.parse(calculateDateStr, formatter);
        LocalDateTime calculateDateLast = LocalDateTime.parse(calculateDateLastStr, formatter);

        List<Map<String,String>> tableData = orderService.getTableData(calculateDate,calculateDateLast,model,session);

        int totalCome = 0;
        int orderCount = tableData.size();
        int allTotalPrice = 0;

        for(Map<String,String>data : tableData){
            //orders 테이블에 물건 여러개 들어가면 가격 ,표시를 빼고 더애서 가져옴
            totalCome += orderService.sumCommaSeparatedNumbers(data.get("amount"));
           //총 수입
            allTotalPrice += Integer.parseInt(data.get("totalPrice"));
            System.out.println("가격:"+data.get("tatalPrice"));
        }

        return ResponseEntity.ok(tableData);
    }


//순번     order_Num : pk auto_intended
//시퀀스 - 시행횟수    시퀀스넘
}

