package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "realTimeStatus")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RealTimeStatus {

    @Id
    @Column(name="rtsNumber",nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long rtsNumber;

    //주문번호
    @OneToOne
    @JoinColumn(name="order_number")
    private Order orderNumber;


    //픽업중
    @Column
    private  int rtsOrderIng;

    //배송중
    @Column
    private int rtsRiderIng;
    
    //배달 완료
    @Column
    private int rtsRiderFinish;

    public void setOrderNumber(Order orderNumber){
        this.orderNumber=orderNumber;
    }
}




