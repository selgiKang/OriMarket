package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
@Slf4j
public class RealTimeService {

    @Autowired
    private final RealTimeRepository rtsRepository;

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

    public boolean update1(Order order, Model model,HttpSession session){
        RealTimeStatus a = rtsRepository.findByorderNumber(order);
        a.setRtsOrderIng(1);
        RealTimeStatus save = rtsRepository.save(a);
        if(save == null){

            return false;
        }else {
            session.setAttribute("a",save.getRtsOrderIng());
            return true;
        }


    }
   /* public void update2(RealTimeStatus orderNumber){
        RealTimeStatus a = rtsRepository.findByorderNumber();
        a.setRtsRiderIng(1);
    }public void update3(RealTimeStatus orderNumber){
        RealTimeStatus a = rtsRepository.findByorderNumber();
        a.setRtsRiderFinish(1);
    }*/





}
