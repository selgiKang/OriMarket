package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.user.User;
import org.geolatte.geom.M;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;


public interface NewOrderRepository extends JpaRepository<NewOrder, Long> {

    List<NewOrder> findByOrderMarketName(String marketName);

    NewOrder findByOrderNumber(String orderNumber);

    List<NewOrder> findByUser(User user);

    @Query("SELECT n FROM NewOrder n WHERE n.created_date > ?1 AND n.created_date < ?2")
    List<NewOrder> findNewOrdersBetweenDates(LocalDateTime calculate_date, LocalDateTime calculate_date_last);

    //containing = 특정 문자열을 포함하는 데이터를 검색 가능
    List<NewOrder> findByCreated_dateContaining(LocalDateTime orderDate);
}
