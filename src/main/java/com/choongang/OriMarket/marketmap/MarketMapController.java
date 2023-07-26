package com.choongang.OriMarket.marketmap;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequiredArgsConstructor
@Slf4j
public class MarketMapController {

    @GetMapping("/marketmap")
    public String marketmap() {
        return "marketmap/marketmap";
    }

    @GetMapping("/shinwon_marketmap")
    public String marketmap2(@RequestParam("marketName") String marketName, Model model) {
        model.addAttribute("marketName",marketName);
        return "marketmap/shinwon_marketmap";
    }

    @GetMapping("/tongin_marketmap")
    public String marketmap3() {
        return "marketmap/tongin_marketmap";
    }

};

