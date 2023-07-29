package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface NewOrderRepository extends JpaRepository<NewOrder, Long> {

    List<NewOrder> findByOrderMarketName(String marketName);

    NewOrder findByOrderNumber(String orderNumber);

    List<NewOrder> findByUser(User user);
}
