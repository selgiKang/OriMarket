package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import lombok.*;

import javax.persistence.*;


@Data
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class RealTimeStatusDto {


    private long rtsNumber;


    private Order orderNumber;


    //픽업중

    private  int rtsOrderIng;

    //배송중
    private int rtsRiderIng;

    //배달 완료
    private int rtsRiderFinish;

    @Builder
    public RealTimeStatusDto(long rtsNumber, Order orderNumber, int rtsOrderIng, int rtsRiderIng, int rtsRiderFinish) {
        this.rtsNumber = rtsNumber;
        this.orderNumber = orderNumber;
        this.rtsOrderIng = rtsOrderIng;
        this.rtsRiderIng = rtsRiderIng;
        this.rtsRiderFinish = rtsRiderFinish;
    }

    public void setOrderNumber(Order orderNumber){
        this.orderNumber=orderNumber;
    }
}




