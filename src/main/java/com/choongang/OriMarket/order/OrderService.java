package com.choongang.OriMarket.order;

import com.choongang.OriMarket.RealTimeStatus.RealTimeRepository;
import com.choongang.OriMarket.RealTimeStatus.RealTimeService;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.net.URI;
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

        public List<Map<String,String>> getTableData(String calculateDate, String calculateDateLast,Model model,HttpSession session){

            List<Map<String,String>> tableData = new ArrayList<>();
            System.out.println("calculateDate"+calculateDate+", calculateLast"+calculateDateLast);
            List<Order> orders = orderRepository.findOrdersBetweenDates(calculateDate,calculateDateLast);

            //사업자 번호 세션꺼 꺼내서
            //그 스토어 이름이랑 오더의 스토어 이르
            Long buUserNumber = Long.valueOf(session.getAttribute("buUserNumber").toString());
            for(Order order : orders){
                //사업자 번호 비교
                if(order.getBusinessUser().getBuUserNumber().equals(buUserNumber)){
                    Map<String, String> orderData = new HashMap<>();
                    orderData.put("date", String.valueOf(order.getOrderDate()));
                    orderData.put("amount",String.valueOf(order.getOrderGoodsPrice()));
                    orderData.put("totalPrice",String.valueOf(order.getOrderGoodsTotalPrice()));
                    tableData.add(orderData);
                }
            }
            model.addAttribute("tableData",tableData);
            return tableData;
        }

        public List<Map<String,String>> allOrderList(String calculateDate, String calculateDateLast,Model model,HttpSession session){

            List<Map<String,String>> tableAllList = new ArrayList<>();
            System.out.println("calculateDate"+calculateDate+", calculateLast"+calculateDateLast);
            List<Order> orders = orderRepository.findOrdersBetweenDates(calculateDate,calculateDateLast);

            //사업자 번호 세션꺼 꺼내서
            //그 스토어 이름이랑 오더의 스토어 이르
            Long buUserNumber = Long.valueOf(session.getAttribute("buUserNumber").toString());

            for(Order order : orders){
                //사업자 번호 비교
                if(order.getBusinessUser().getBuUserNumber().equals(buUserNumber)){
                    Map<String, String> orderAllList = new HashMap<>();
                    //주문 날짜
                    orderAllList.put("date", String.valueOf(order.getOrderDate()));
                    //아이템 갯수
                    orderAllList.put("goodsCount",order.getOrderGoodsNum());
                    //아이템 이름
                    orderAllList.put("goodsName",order.getOrderGoodsName());
                    //아이템 가격
                    orderAllList.put("amount",order.getOrderGoodsPrice());
                    //아이템 총가격
                    orderAllList.put("totalPrice",order.getOrderGoodsTotalPrice());
                    tableAllList.add(orderAllList);
                }
            }
            model.addAttribute("tableAllList",tableAllList);
            return tableAllList;
        }

        // , 를 +로 바꿔서 더해서 반환
    public int sumCommaSeparatedNumbers(String commaSeparatedNumbers) {
        int sum = 0;
        String[] numbers = commaSeparatedNumbers.split(",");

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



}
