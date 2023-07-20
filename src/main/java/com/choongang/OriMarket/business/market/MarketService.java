package com.choongang.OriMarket.business.market;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class MarketService {

    @Autowired
    private final MarketRepository marketRepository;

    public Market findMarket(String marketName){
        Market markets = marketRepository.findByMarketName(marketName);

        return markets;
    }
}
