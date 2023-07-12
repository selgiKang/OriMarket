package com.choongang.OriMarket.RealTimeStatus;

import com.choongang.OriMarket.order.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface RealTimeRepository extends JpaRepository<RealTimeStatus, Long> {



    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query(value = "UPDATE RealTimeStatus r SET r.rtsOrderIng=1 WHERE r.orderNumber=?1")
    RealTimeStatus updateOrderNumber(String orderNumber,Integer rtsOrderIng);

    RealTimeStatus findByorderNumber(String orderNumber);

}
