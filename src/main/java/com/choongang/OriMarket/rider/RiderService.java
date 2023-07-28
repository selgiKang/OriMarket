package com.choongang.OriMarket.rider;


import com.choongang.OriMarket.RealTimeStatus.RealTimeRepository;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.order.NewOrderRepository;
import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class RiderService {

    @Autowired
    private final RiderRepository riderRepository;

    private final NewOrderRepository newOrderRepository;

    private final RealTimeRepository rtsRepository;


    public boolean checkRiderId(String riderId){
        return riderRepository.existsByRiderId(riderId);
    }

    public boolean riderJoin(Rider rider, HttpSession session) {

        // 만약 가입하려는 운전면허증으로 가입된 라이더가있으면 false반환
        if(riderRepository.findByDriverLicense(rider.getDriverLicense()) != null){return false;}

        Rider saverider = riderRepository.save(rider);
        if(saverider == null){
            return false;
        }else {
            return true;
        }
    }

    public boolean riderLogin(Rider rider,HttpSession session){
        Rider byRiderId = riderRepository.findByRiderId(rider.getRiderId());

        if(byRiderId == null){return false;}

        if(!byRiderId.getRiderPassword().equals(rider.getRiderPassword())){
            return false;
        }else {
            session.setAttribute("riderSeq",byRiderId.getRiderSeq());
            return true;
        }
    }

   public List<NewOrder> riderOrderSearch(){
       List<NewOrder> allNewOrder = newOrderRepository.findAll();
       List<NewOrder> newOrders = new ArrayList<>();

       for(NewOrder newOrder:allNewOrder){
           String orderStatus = newOrder.getOrderStatus();
           if (orderStatus == null) {
               // 주문 상태가 null인 경우 아무 작업도 하지 않음
           } else if (orderStatus.equals("배달시작")) {
               newOrders.add(newOrder);
           }
       }
        return newOrders;
    }

    public NewOrder riderOrderAccept(String orderNumber,HttpSession session){
        NewOrder byOrderNumber = newOrderRepository.findByOrderNumber(orderNumber);

        Rider riderSeq = riderRepository.findById((Long) session.getAttribute("riderSeq")).orElseThrow();
        byOrderNumber.setRider(riderSeq);
        byOrderNumber.setOrderStatus("배달시작");
        newOrderRepository.save(byOrderNumber);

        return byOrderNumber;
    }

    public NewOrder riderOrderAccept1(String orderNumber,HttpSession session){
        NewOrder byOrderNumber = newOrderRepository.findByOrderNumber(orderNumber);

        Rider riderSeq = riderRepository.findById((Long) session.getAttribute("riderSeq")).orElseThrow();
        byOrderNumber.setRider(riderSeq);
        byOrderNumber.setOrderStatus("배달완료");
        newOrderRepository.save(byOrderNumber);

        return byOrderNumber;
    }
}