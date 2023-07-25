package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface RealTimeRepository extends JpaRepository<RealTimeStatus, Long> {

    //7.20 테스트 승엽
    RealTimeStatus findByOrderNumber(String orderNumber);
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query(value = "UPDATE RealTimeStatus r SET r.rtsOrderIng=1 WHERE r.orderNumber=?1")
    RealTimeStatus updateOrderNumber(String orderNumber,Integer rtsOrderIng);

    RealTimeStatus findByorderNumber(Order orderNumber);

}
