package com.choongang.OriMarket.order;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface OrderRepository extends JpaRepository<Order, String> {

//7.16 테스트 승엽
//List<String> findOrderNumberByOrderType(String orderType);

}
