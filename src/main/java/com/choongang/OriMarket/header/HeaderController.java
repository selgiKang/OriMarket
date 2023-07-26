package com.choongang.OriMarket.header;

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
public class HeaderController {

    @Autowired
    private  final MarketRepository marketRepository;
    private final UserAddressRepository userAddressRepository;

    @GetMapping("/header_index")
    public String header_index() {
        return "header/header_index";
    }
    @GetMapping("/header_login")
    public String header_login() {
        return "header/header_login";
    }
    @GetMapping("/header_search")
    public String header_search(@RequestParam("marketSeq") String marketSeq, User user, Model model, HttpSession session) {
        return "header/header_search";
    }


};
