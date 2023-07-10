package com.choongang.OriMarket.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LoginController {

    @Autowired
    private final LoginService loginService;

    @GetMapping("/")
    public String login() {
        return "store/store_menu_search";
    }

    @PostMapping("/login")
    public String loginId(@ModelAttribute User userVo) {
        boolean isTrue = loginService.login(userVo);
        if(isTrue){
            return "user/loginsuccess";
        }
        return "user/login";
    }

};
