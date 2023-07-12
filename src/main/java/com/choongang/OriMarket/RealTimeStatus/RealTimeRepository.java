package com.choongang.OriMarket.RealTimeStatus;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RealTimeRepository extends JpaRepository<RealTimeStatus, Long> {

   // RealTimeStatus findByOrderNumber(String orderNumber);

}
