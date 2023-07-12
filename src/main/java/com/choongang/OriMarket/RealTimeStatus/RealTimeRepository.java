package com.choongang.OriMarket.RealTimeStatus;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RealTimeRepository extends JpaRepository<RealTimeStatus, Long> {

   // RealTimeStatus findByOrderNumber(String orderNumber);
}
