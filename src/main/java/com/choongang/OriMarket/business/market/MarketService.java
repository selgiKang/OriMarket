package com.choongang.OriMarket.business.market;

import com.choongang.OriMarket.utill.DistanceUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class MarketService {

    private final MarketRepository marketRepository;

    public Market findMarket(String marketName){
        Market markets = marketRepository.findByMarketName(marketName);

        return markets;
    }


    public List<Market> findMarketsWithinRadius(double targetLatitude, double targetLongitude, double radiusInKm) {
        List<Market> allMarkets = marketRepository.findAll();
            //마켓리스트를 스트림(데이터 형식을 바꿀 수 있는 것) 요소로 바꿔서 필터로 걸 수 있게
        return allMarkets.stream()              //거리 계산해서 마켓 꺼내기
                .filter(market -> DistanceUtil.calculateDistance(targetLatitude, targetLongitude, market.getMarketLatitude(), market.getMarketLongitude()) <= radiusInKm)
                .collect(Collectors.toList()); // collect : 결과 뽑는 것
    }
}
