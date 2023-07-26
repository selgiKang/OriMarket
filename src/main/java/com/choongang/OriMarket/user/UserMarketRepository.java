package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.market.Market;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface UserMarketRepository extends JpaRepository<UserMarket, Long> {

    List<UserMarket> findByUser(User user);

    UserMarket findByMarket(Market market);
}

