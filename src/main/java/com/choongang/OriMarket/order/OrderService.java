package com.choongang.OriMarket.order;

import com.choongang.OriMarket.RealTimeStatus.RealTimeRepository;
import com.choongang.OriMarket.RealTimeStatus.RealTimeService;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import com.choongang.OriMarket.manager.user.ManagerUser;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.net.URI;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Slf4j
public class OrderService {

    @Autowired
    private  final OrderRepository orderRepository;
    private final NewOrderRepository newOrderRepository;
    private final ItemRepository itemRepository;
    private final UserRepository userRepository;

    static final String cid = "TC0ONETIME";
    static final String admin_key = "${e584b59b9f572556fbac3673883cb029}";
    private  Order order;



       /*
       public Order kakaoPayReady() {


            RestTemplate restTemplate = new RestTemplate();

            HttpHeaders headers = new HttpHeaders();
            //!!!! 개인코드 다른 곳 공개X !!!!!
            headers.add("Authorization","KakaoAK"+"e584b59b9f572556fbac3673883cb029");
            headers.add("Accept", org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE);
            headers.add("Content-Type", org.springframework.http.MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

            MultiValueMap<String,String> params = new LinkedMultiValueMap<String,String>();
            //가맹점 코드 test코드 카카오 제공
            params.add("cid",cid);
            //주문번호
            params.add("partner_order_id", String.valueOf(order.getOrderNumber()));
            //주문자 id
            params.add("partner_user_id",order.getOrderUserId());
            //총 금액
            params.add("total_amount", String.valueOf(order.getOrderTotalPrice()));
            //부과세(값을 보내지 않을 경우 vat 자동 계산)
            params.add("vat_amount",null);
            //성공
            params.add("approval_url","https://localhost:8080/order_delivery");
            //취소
            params.add("cancel_url","https://localhost:8080/order_paymentpage");
            //실패
            params.add("fail_url","https://localhost:8080/cart");

            HttpEntity<MultiValueMap<String,String>> requestEntity = new HttpEntity<>(params,headers);

           order = restTemplate.postForObject(
                   "https://kapi.kakao.com/v1/payment/ready",
                   requestEntity,
                   KakaoReadyResponse.class);
           return order;

        }
        */

        public boolean orderDelivery(Order order, HttpSession session){

            RealTimeStatus rtsStatus = new RealTimeStatus();
            //결제하기 누르면 주문내역에 저장, 여기서 주문내역 생성됨
            rtsStatus.setOrderNumber(order);
            Order saveOrder = orderRepository.save(order);
            if(saveOrder==null){
                return false;
            }else{
                session.setAttribute("orderNumber",saveOrder.getOrderNumber());
                return true;
            }
        }

        public List<Map<String,String>> getTableData(String calculateDate, String calculateDateLast, Model model, HttpSession session){

            List<Map<String,String>> tableData = new ArrayList<>();
            System.out.println("calculateDate"+calculateDate+", calculateLast"+calculateDateLast);

            String calculateDateSixDigits = calculateDate.substring(0, 6);
            String calculateDateLastSixDigits = calculateDateLast.substring(0, 6);

            List<NewOrder> orders = newOrderRepository.findNewOrdersBetweenDates(calculateDateSixDigits,calculateDateLastSixDigits);

            //사업자 번호 세션꺼 꺼내서
            //그 스토어 이름이랑 오더의 스토어 이름
            String buUserNumber = session.getAttribute("buUserNumber").toString();

            for (NewOrder order : orders) {
                for (NewOrderDetail orderDetail : order.getNewOrderDetails()) {
                    String buStoreNumbers = orderDetail.getBuStoreNumber();

                    //사업자 번호가 일치하는 것 중
                    if (buStoreNumbers != null && buStoreNumbers.equals(buUserNumber)) {
                        Map<String, String> orderData = new HashMap<>();
                        //배달완료가 아닌 것은 이렇게
                        if (order.getOrderStatus() == null || !order.getOrderStatus().equals("배달완료")) {
                            // 배달완료가 아닌 경우에 대한 처리
                            orderData=null;
                        }else{
                            orderData.put("date", String.valueOf(order.getCreatedDate()));
                            orderData.put("amount", String.valueOf(orderDetail.getItemPrice()));
                            orderData.put("totalPrice", String.valueOf(order.getOrderGoodsTotalPrice()));
                            orderData.put("orderNumber",order.getOrderNumber());
                        }
                        if(orderData!=null){
                            tableData.add(orderData);
                        }
                    }
                }
            }
            model.addAttribute("tableData",tableData);
            return tableData;
        }

//        public List<Map<String,String>> allOrderList(String calculateDate, String calculateDateLast,Model model,HttpSession session){
//
//            List<Map<String,String>> tableAllList = new ArrayList<>();
//            System.out.println("calculateDate"+calculateDate+", calculateLast"+calculateDateLast);
//            List<Order> orders = orderRepository.findOrdersBetweenDates(calculateDate,calculateDateLast);
//
//            //사업자 번호 세션꺼 꺼내서
//            //그 스토어 이름이랑 오더의 스토어 이르
//            Long buUserNumber = Long.valueOf(session.getAttribute("buUserNumber").toString());
//
//            for(Order order : orders){
//                //사업자 번호 비교
//                if(order.getBusinessUser().getBuUserNumber().equals(buUserNumber)){
//                    Map<String, String> orderAllList = new HashMap<>();
//                    //주문 날짜
//                    orderAllList.put("date", String.valueOf(order.getOrderDate()));
//                    //아이템 갯수
//                    orderAllList.put("goodsCount",order.getOrderGoodsNum());
//                    //아이템 이름
//                    orderAllList.put("goodsName",order.getOrderGoodsName());
//                    //아이템 가격
//                    orderAllList.put("amount",order.getOrderGoodsPrice());
//                    //아이템 총가격
//                    orderAllList.put("totalPrice",order.getOrderGoodsTotalPrice());
//                    tableAllList.add(orderAllList);
//                }
//            }
//            model.addAttribute("tableAllList",tableAllList);
//            return tableAllList;
//        }

        // , 를 +로 바꿔서 더해서 반환
    public int sumCommaSeparatedNumbers(String csNumbers) {
        int sum = 0;
        String[] numbers = csNumbers.split(",");

        for (String number : numbers) {
            sum += Integer.parseInt(number);
        }

        return sum;
    }

        //7.18 테스트 승엽
        public List<Order> getAllOrders() {
            List<Order> all = orderRepository.findAll();

            return all; // 모든 주문 목록을 가져오는 방식에 맞게 구현
        }


    //특정 날짜 조회
    public List<NewOrder> getDetailsByDate(String date,HttpSession session){
        System.out.println("데이트:"+date);
          List<NewOrder> getDate= newOrderRepository.findByCreatedDateContaining(date);

        return getDate;
    }

    //주문 번호로 검색
//    public Order getOrderNumberList(String orderNumber){
//            Order orderNumberResult = orderRepository.findByOrderNumber(orderNumber);
//            return orderNumberResult;
//    }

//    public List<Order> findByUserIdList(String userId){
//            List<Order> getOrderUserIdList = orderRepository.findByOrderUserId(userId);
//            return getOrderUserIdList;
//        }

    @Transactional
    public Page<NewOrder> pageList(int page) {
        return  newOrderRepository.findAll(PageRequest.of(page,3, Sort.by(Sort.Direction.DESC,"newOrderSeq")));
    }


}
