package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
//@RequiredArgsConstructor
@Slf4j
public class RealTimeService {

    @Autowired
    private final RealTimeRepository rtsRepository;


    @Autowired
    public RealTimeService(RealTimeRepository rtsRepository) {
        this.rtsRepository = rtsRepository;
    }

    //주문번호 넣어서 생성, 나머지 값은 디폴트 들어가게
    public boolean insertRts(RealTimeStatus rts){
        //rts가 주문번호....넣어야 하는데...
        RealTimeStatus saveRts = rtsRepository.save(rts);
        if(saveRts == null){
            return false;
        }else{
            return true;
        }
    }


    //7.20 테스트 승엽
    public RealTimeStatus update1(Order order, HttpSession session) {
        order.setOrderNumber(String.valueOf(session.getAttribute("orderNumber")));
        RealTimeStatus a = rtsRepository.findByorderNumber(order);
        a.setRtsOrderIng(1);
        return rtsRepository.save(a); // 변경 사항을 저장하고 리턴
    }

    public RealTimeStatus update2(Order order, HttpSession session) {
        order.setOrderNumber(String.valueOf(session.getAttribute("orderNumber")));
        RealTimeStatus a = rtsRepository.findByorderNumber(order);
        a.setRtsRiderFinish(1);
        return rtsRepository.save(a); // 변경 사항을 저장하고 리턴
    }

    public boolean findRts(Order order,HttpSession session){
        order.setOrderNumber(String.valueOf(session.getAttribute("orderNumber")));
        RealTimeStatus a2 = rtsRepository.findByorderNumber(order);
        if(a2 != null){
            return true;
        }
        return false;
    }

   /* public void update2(RealTimeStatus orderNumber){
        RealTimeStatus a = rtsRepository.findByorderNumber();
        a.setRtsRiderIng(1);
    }public void update3(RealTimeStatus orderNumber){
        RealTimeStatus a = rtsRepository.findByorderNumber();
        a.setRtsRiderFinish(1);
    }*/

    //7.20 테스트 승엽
    public RealTimeStatus findByOrderNumber(String orderNumber) {
        return rtsRepository.findByOrderNumber(orderNumber);
    }

    public void updateRts(RealTimeStatus rts) {
        rtsRepository.save(rts);
    }



}
