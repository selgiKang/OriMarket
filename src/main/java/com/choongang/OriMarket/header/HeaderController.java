package com.choongang.OriMarket.header;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Log4j2
public class HeaderController {

    @GetMapping("/header_index")
    public String header_index() {
        return "header/header_index";
    }

    @GetMapping("/header_login")
    public String header_login() {
        return "header/header_login";
    }

    @GetMapping("/header_search")
    public String header_search() {
        return "header/header_search";
    }

    @GetMapping("/business_header_index")
    public String business_header_index() {
        return "header/business_header_index";
    }

}
