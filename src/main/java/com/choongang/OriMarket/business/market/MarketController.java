package com.choongang.OriMarket.business.market;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MarketController {

    @Autowired
    private final MarketService marketService;

    private final MarketRepository marketRepository;

    @GetMapping("/market_search")
    public String marketSearch(@ModelAttribute Market market, HttpSession session){

        Market byMarketName = marketRepository.findByMarketName(market.getMarketName());
        session.setAttribute("marketName",byMarketName.getMarketName());
        session.setAttribute("marketSeq",byMarketName.getMarketSeq());
        return "main/main";
    }
}
