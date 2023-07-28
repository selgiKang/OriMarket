package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.market.Market;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface NewOrderRepository extends JpaRepository<NewOrder, Long> {



}
