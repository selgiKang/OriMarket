package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.market.Market;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface OrderRepository extends JpaRepository<Order, String> {



    /* 주문내역조회, 사업자 번호 추가 */
    @Query("SELECT o FROM Order o WHERE o.orderDate > ?1 AND o.orderDate < ?2")
    List<Order> findOrdersBetweenDates(String calculate_date, String calculate_date_last);

    //containing = 특정 문자열을 포함하는 데이터를 검색 가능
    List<Order> findByOrderDateContaining(String orderDate);

    List<Order> findByMarketSeq(Market marketSeq);
}
