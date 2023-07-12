/*
package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
@Slf4j
public class RealTimeService {

    @Autowired
    private final RealTimeRepository rtsRepository;

    //주문번호 넣어서 생성, 나머지 값은 디폴트 들어가게
    public boolean insertRts(RealTimeStatus rts, Order rtsOrderNumber, HttpSession session){
        //rts가 주문번호....넣어야 하는데...
        rts.setOrderNumber(rtsOrderNumber);
        RealTimeStatus saveRts = rtsRepository.save(rts);

        if(saveRts == null){
            return false;
        }else{
            rts.setRtsOrderIng(1);
            session.setAttribute("rtsOrderIng",rts.getRtsOrderIng());
            return true;
        }
    }

}
*/
