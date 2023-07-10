package com.choongang.OriMarket.marketmap;

import com.choongang.OriMarket.user.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MarketMapController {

    @Autowired
    private final LoginService loginService;

    @GetMapping("/marketmap")
    public String footer() {
        return "marketmap/marketmap";
    }


};
