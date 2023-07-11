package com.choongang.OriMarket.marketmap;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MarketMapController {

    @GetMapping("/marketmap")
    public String footer() {
        return "marketmap/marketmap";
    }


};
