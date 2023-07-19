package com.choongang.OriMarket.business.market;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MarketRepository extends JpaRepository<Market,Long> {

    Market findByMarketName(String marketName);
}
