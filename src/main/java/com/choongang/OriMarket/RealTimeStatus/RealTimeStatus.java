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

    //배송시작
    @Column
    private Integer rtsRiderStart;

    //배송중
    @Column
    private int rtsRiderIng;
    
    //배달 완료
    @Column
    private int rtsRiderFinish;


    //7.20 테스트 승엽
    // Getters and Setters
    public long getRtsNumber() {
        return rtsNumber;
    }

    public void setRtsNumber(long rtsNumber) {
        this.rtsNumber = rtsNumber;
    }

    public Order getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Order orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getRtsOrderIng() {
        return rtsOrderIng;
    }

    public void setRtsOrderIng(int rtsOrderIng) {
        this.rtsOrderIng = rtsOrderIng;
    }

    public int getRtsRiderIng() {
        return rtsRiderIng;
    }

    public void setRtsRiderIng(int rtsRiderIng) {
        this.rtsRiderIng = rtsRiderIng;
    }

    public int getRtsRiderFinish() {
        return rtsRiderFinish;
    }

    public void setRtsRiderFinish(int rtsRiderFinish) {
        this.rtsRiderFinish = rtsRiderFinish;
    }

   /* public void setOrderNumber(Order orderNumber){
        this.orderNumber=orderNumber;
    }*/
}




