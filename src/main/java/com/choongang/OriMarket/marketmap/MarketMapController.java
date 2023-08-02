package com.choongang.OriMarket.marketmap;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketRepository;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.utill.DistanceUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;


@Controller
@RequiredArgsConstructor
@Slf4j
public class MarketMapController {

    @Autowired
    private final MarketRepository marketRepository;

    @GetMapping("/marketmap")
    public String marketmap() {
        return "marketmap/marketmap";
    }
    @GetMapping("/shinwon_marketmap")
    public String marketmap2(@RequestParam("marketName") String marketName,
                             @RequestParam("latitude") Double latitude,
                             @RequestParam("longitude") Double longitude,
                             Model model){
        System.out.println("위도:"+latitude);
        System.out.println("경도:"+longitude);
        model.addAttribute("marketName",marketName);
        Market byMarketName = marketRepository.findByMarketName(marketName);

        double radiusInKm = 6.0;
        boolean b = DistanceUtil.calculateDistance(latitude, longitude, byMarketName.getMarketLatitude(), byMarketName.getMarketLongitude()) > radiusInKm;
        if(b){
            System.out.println("거리가 너무멀어 배달 할수없습니다.");
        }else {
            System.out.println("아무것도실행안해버리기");
        }


        List<BusinessStore> businessStore = byMarketName.getBusinessStore();
        model.addAttribute("buStore",businessStore);
        return "marketmap/shinwon_marketmap";
    }

    @GetMapping("/tongin_marketmap")
    public String marketmap3() {
        return "marketmap/tongin_marketmap";
    }

    @GetMapping("/dongdaemun_marketmap")
    public String marketmap4() {
        return "marketmap/dongdaemun_marketmap";
    }

    @GetMapping("/gyoengdong_marketmap")
    public String marketmap5() {
        return "marketmap/gyoengdong_marketmap";
    }

    @GetMapping("/namdaemun_marketmap")
    public String marketmap6() {
        return "marketmap/namdaemun_marketmap";
    }
};

