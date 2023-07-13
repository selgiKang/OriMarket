package com.choongang.OriMarket.main;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {


    @GetMapping("/")
    public String main() {
        return "main/main";
    }

    @GetMapping("/search")
    public String search() {
        return "main/search";
    }


};
