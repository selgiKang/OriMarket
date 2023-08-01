package com.choongang.OriMarket.order;

import com.choongang.OriMarket.manager.user.ManagerUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Log4j2
public class OrderService {

    @Autowired
    private final NewOrderRepository newOrderRepository;

    static final String cid = "TC0ONETIME";
    static final String admin_key = "${e584b59b9f572556fbac3673883cb029}";


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

    public int sumCommaSeparatedNumbers(String csNumbers) {
        int sum = 0;
        String[] numbers = csNumbers.split(",");

        for (String number : numbers) {
            sum += Integer.parseInt(number);
        }

        return sum;
    }


    //특정 날짜 조회
    public List<NewOrder> getDetailsByDate(String date,HttpSession session){
        System.out.println("데이트:"+date);
          List<NewOrder> getDate= newOrderRepository.findByCreatedDateContaining(date);

        return getDate;
    }


 //   @Transactional : 단순 읽기 작업만하고 변경하지 않는다면 필요 X
    //트랜잭션 없는 상태에서 LazyLoading으로 연관 객체 접근하면 예외 발생
    //이 어노테이션 사용 시 트랜잭션 내에서 LazyLoading 사용 가능해짐
    public Page<NewOrder> pageList(ManagerUser managerUser,String OrderStatus, String orderStatusNo,Pageable pageable) {

            return newOrderRepository.findByManagerUser(managerUser,OrderStatus,orderStatusNo,pageable);
    }


}
