
package com.choongang.OriMarket.order;

import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.user.CartService;
import com.choongang.OriMarket.user.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
public class OrderController {


    private final OrderService orderService;
    private final CartService cartService;

    private final  NewOrderRepository newOrderRepository;

    private final NewOrderDetailRepository newOrderDetailRepository;

    private final ItemRepository itemRepository;


    @Autowired
    public OrderController(OrderService orderService, CartService cartService, NewOrderRepository newOrderRepository, NewOrderDetailRepository newOrderDetailRepository, ItemRepository itemRepository){
        this.orderService = orderService;
        this.cartService = cartService;
        this.newOrderRepository = newOrderRepository;
        this.newOrderDetailRepository = newOrderDetailRepository;
        this.itemRepository = itemRepository;
    }

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
    public String sellerList(@RequestParam("calculate_date") String calculateDate,
                                    @RequestParam("calculate_date_last") String calculateDateLast,
                                    Model model,HttpSession session){
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
            //역순 정렬
            Collections.reverse(pastOrderList);
            model.addAttribute("pastOrderList", pastOrderList);
            return "order/order_pastorder";
        }
    }



    //특정 날짜 정보
    @GetMapping("/details")
    public String showDetailsPage(@RequestParam("orderNumber") String orderNumber, Model model,HttpSession session) {
        // 날짜 정보를 서비스로 전달하여 해당 날짜의 정보를 가져온다.

        NewOrder detailsDataList = newOrderRepository.findByOrderNumber(orderNumber);
        System.out.println(detailsDataList.getOrderNumber());
        model.addAttribute("detailsDataList", detailsDataList);
        return "calculate/detailsCalculate"; // details.jsp 또는 해당하는 뷰 페이지의 이름
    }

    @GetMapping("/order_receiptDelivery")
    public String pastOrderDetailList(@RequestParam("orderNumber")String orderNumber,HttpSession session,Model model){

        NewOrder resultPastOrder = newOrderRepository.findByOrderNumber(orderNumber);
        model.addAttribute("newOrder",resultPastOrder);

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
    public ResponseEntity<List<Map<String,String>>> calculateRequest(@RequestParam("calculate_date") String calculateDate,
                                                                     @RequestParam("calculate_date_last") String calculateDateLast,
                                                                     HttpSession session, Model model){
        if(orderService.getTableData(calculateDate,calculateDateLast,model,session)==null){
            return ResponseEntity.ok(Collections.emptyList());
        }else{
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
    }


//순번     order_Num : pk auto_intended
//시퀀스 - 시행횟수    시퀀스넘
}

