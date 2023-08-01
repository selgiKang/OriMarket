package com.choongang.OriMarket.order;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface NewOrderDetailRepository extends JpaRepository<NewOrderDetail, Long> {

    List<NewOrderDetail> findByOrderNumber(String orderNumber);

    List<NewOrderDetail> findByBuStoreName(String buStoreName);

}
