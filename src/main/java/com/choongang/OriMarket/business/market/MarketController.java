package com.choongang.OriMarket.business.market;

import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserMarket;
import com.choongang.OriMarket.user.UserMarketRepository;
import com.choongang.OriMarket.user.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MarketController {

    @Autowired
    private final MarketService marketService;

    private final MarketRepository marketRepository;

    private final UserRepository userRepository;

    private final UserMarketRepository userMarketRepository;

    @GetMapping("/market_search")
    public String marketSearch(@ModelAttribute Market market, HttpSession session,UserMarket userMarket){
        Market byMarketName = marketRepository.findByMarketName(market.getMarketName());
        session.setAttribute("marketName",byMarketName.getMarketName());
        session.setAttribute("marketSeq",byMarketName.getMarketSeq());

        User userSeq = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
        userMarket.setUser(userSeq);
        userMarket.setUserMarketName((String) session.getAttribute("marketName"));
        userMarketRepository.save(userMarket);

        return "main/main";
    }
}
