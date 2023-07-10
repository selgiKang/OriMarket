package com.choongang.OriMarket.footer;

import com.choongang.OriMarket.user.LoginService;
import com.choongang.OriMarket.user.User;
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
public class FooterController {

    @Autowired
    private final LoginService loginService;

    @GetMapping("/footer")
    public String footer() {
        return "footer/footer";
    }


};
