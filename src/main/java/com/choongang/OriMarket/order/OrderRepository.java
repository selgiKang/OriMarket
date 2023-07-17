package com.choongang.OriMarket.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface OrderRepository extends JpaRepository<Order, String> {

//7.16 테스트 승엽
List<String> findOrderNumberByOrderType(String orderType);

    /* 주문내역조회, 사업자 번호 추가 */
    @Query("SELECT o FROM Order o WHERE o.orderDate > ?1 AND o.orderDate < ?2")
    List<Order> findOrdersBetweenDates(String calculate_date, String calculate_date_last);
}
