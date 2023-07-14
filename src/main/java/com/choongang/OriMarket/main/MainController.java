package com.choongang.OriMarket.main;

import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {

    @Autowired
    private final MainService mainService;

    @GetMapping("/")
    public String main() {
        return "main/main";
    }

    @GetMapping("/search")
    public String search() {
        return "main/search";
    }

    @PostMapping("/search")
    public String search1(@ModelAttribute User user, HttpSession session){
        System.out.println("주소: "+user.getUserAddress());
        mainService.updateAddress(session,user);
        return "main/main";
    }



};
