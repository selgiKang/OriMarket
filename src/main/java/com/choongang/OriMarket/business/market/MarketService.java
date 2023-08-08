package com.choongang.OriMarket.business.market;

import com.choongang.OriMarket.utill.DistanceUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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

    public List<Market> findMarketsWithinRadius(double targetLatitude, double targetLongitude, double radiusInKm) {
        List<Market> allMarkets = marketRepository.findAll();

        return allMarkets.stream()
                .filter(market -> DistanceUtil.calculateDistance(targetLatitude, targetLongitude, market.getMarketLatitude(), market.getMarketLongitude()) <= radiusInKm)
                .collect(Collectors.toList());
    }
}
