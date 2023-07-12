package com.choongang.OriMarket.RealTimeStatus;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface RealTimeRepository extends JpaRepository<RealTimeStatus, Long> {

//    @Modifying(clearAutomatically = true, flushAutomatically = true)
//    @Query(value="UPDATE orimarket.real_time_status r SET r.rts_order_ing=1  WHERE r.order_number= ?1")
//    RealTimeStatus updateOrderNumber(String orderNumber,Integer rtsOrderIng);

}
