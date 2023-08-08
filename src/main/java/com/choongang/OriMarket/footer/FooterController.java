package com.choongang.OriMarket.footer;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FooterController {

    @GetMapping("/footer")
    public String footer() {
        return "footer/footer";
    }

    @GetMapping("/nav_footer")
    public String nav_footer() {
        return "footer/nav_footer";
    }


};
