package com.choongang.OriMarket.rider;


import com.choongang.OriMarket.RealTimeStatus.RealTimeRepository;
import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.order.NewOrderRepository;

import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.user.CartItem;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.w3c.dom.ls.LSException;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;


@Service
@RequiredArgsConstructor
@Slf4j
public class RiderService {

    @Autowired
    private final RiderRepository riderRepository;

    private final NewOrderRepository newOrderRepository;

    private final RealTimeRepository rtsRepository;


    //7.31 라이더 테스트
    public List<Rider> getAllRiders() {
        return riderRepository.findAll();
    }

    // 선택된 라이더들을 삭제하는 메서드
    @Transactional
    public void deleteRiders(List<String> riderIds) {
        for (String riderId : riderIds) {
            Rider rider = riderRepository.findByRiderId(riderId);
            if (rider != null) {
                riderRepository.delete(rider);
            }
        }
    }
    //폼 데이터 출력




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

    public boolean riderLogin(Rider rider, HttpSession session, Model model){
        Rider byRiderId = riderRepository.findByRiderId(rider.getRiderId());

        if(byRiderId == null){return false;}

        if(!byRiderId.getRiderPassword().equals(rider.getRiderPassword())){
            return false;
        }else {
            List<NewOrder> byRiderOrderByCreatedDateAsc = newOrderRepository.findByRiderOrderByCreatedDateDesc(byRiderId);
            for(NewOrder newOrder:byRiderOrderByCreatedDateAsc){
                System.out.println("요청사항:"+newOrder.getForRider());
            }
            model.addAttribute("orderaccept2", byRiderOrderByCreatedDateAsc);
            session.setAttribute("riderSeq",byRiderId.getRiderSeq());
            return true;
        }
    }

   public List<NewOrder> riderOrderSearch(){
       List<NewOrder> allNewOrder = newOrderRepository.findAll();
       List<NewOrder> newOrders = new ArrayList<>();

       for(NewOrder newOrder:allNewOrder){
           String orderStatus = newOrder.getOrderStatus();
           if(newOrder.getRider() == null) {
               if (orderStatus == null) {
                   // 주문 상태가 null인 경우 아무 작업도 하지 않음
               } else if (orderStatus.equals("픽업완료")) {
                   newOrders.add(newOrder);
               }
           }
       }
        return newOrders;
    }

    public NewOrder riderOrderAccept(String orderNumber,HttpSession session){
        NewOrder byOrderNumber = newOrderRepository.findByOrderNumber(orderNumber);

        if(byOrderNumber.getRider() == null) {
            Rider riderSeq = riderRepository.findById((Long) session.getAttribute("riderSeq")).orElseThrow();
            byOrderNumber.setRider(riderSeq);
            newOrderRepository.save(byOrderNumber);
        }else{
            System.out.println("이미 배차요청이 완료된 주문입니다.");
        }

        return byOrderNumber;
    }

    public NewOrder riderOrderAccept1(String orderNumber,HttpSession session){
        NewOrder byOrderNumber = newOrderRepository.findByOrderNumber(orderNumber);
        byOrderNumber.setOrderStatus("배달시작");
        newOrderRepository.save(byOrderNumber);

        return byOrderNumber;
    }

    public List<NewOrder> riderOrderAccept2(String orderNumber,HttpSession session){
        NewOrder byOrderNumber = newOrderRepository.findByOrderNumber(orderNumber);
        byOrderNumber.setOrderStatus("배달완료");
        newOrderRepository.save(byOrderNumber);
        List<NewOrder> byRiderOrder = newOrderRepository.findByRider(byOrderNumber.getRider());

        return byRiderOrder;
    }


}