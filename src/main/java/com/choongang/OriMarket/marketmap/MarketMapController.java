package com.choongang.OriMarket.marketmap;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketRepository;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserAddress;
import com.choongang.OriMarket.user.UserAddressRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor
@Slf4j
public class MarketMapController {

    @Autowired
    private  final MarketRepository marketRepository;
    private final UserAddressRepository userAddressRepository;

    @GetMapping("/marketmap")
    public String marketmap() {
        return "marketmap/marketmap";
    }

    @GetMapping("/shinwon_marketmap")
    public String marketmap2(@RequestParam("marketSeq") String marketSeq, User user, HttpSession session, Model model) {
        Long marketSeqResult = Long.valueOf(marketSeq);
        Market markets = marketRepository.findByMarketSeq(marketSeqResult);
        //모델? 세션?
        model.addAttribute("marketInfo",markets);

        //유저 번호로 유저 저장된 리스트 가져오기
        if(session.getAttribute("userSeq")!=null){
            Long userSeq = Long.valueOf(session.getAttribute("userSeq").toString());
            user.setUserSeq(userSeq);
            List<UserAddress> userAddressList = userAddressRepository.findByUser(user);
            model.addAttribute("userAddress",userAddressList);
            System.out.println("address길이: "+userAddressList.size());
        }

        return "marketmap/shinwon_marketmap";
    }

    @GetMapping("/tongin_marketmap")
    public String marketmap3() {
        return "marketmap/tongin_marketmap";
    }

};

