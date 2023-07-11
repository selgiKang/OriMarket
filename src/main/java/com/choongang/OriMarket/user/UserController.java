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
public class UserController {

    @Autowired
    private final UserService userService;

    @GetMapping("/login")
    public String login() {
        return "user/login";
    }
    @GetMapping("/join")
    public String join() {
        return "user/join";
    }
    @GetMapping("/update")
    public String update() {
        return "user/update";
    }
    @GetMapping("/delete")
    public String delete() {
        return "user/delete";
    }
    @GetMapping("/list")
    public String list() {
        return "user/list";
    }


    @GetMapping("/mypage")
    public String mypage() {
        return "user/mypage";
    }

    @GetMapping("/cart")
    public String cart() {
        return "user/cart";
    }
    @GetMapping("/infolist")
    public String userlist() {
        return "user/user_infolist";
    }

    @PostMapping("/login")
    public String loginId(@ModelAttribute User uservo) {
        boolean isTrue = userService.login(uservo);
        if(isTrue){
            return "user/loginsuccess";
        }
        return "user/login";
    }

    @PostMapping("/join")
    public String joinUser(@ModelAttribute User user) {

        if(userService.join(user)){
            return "user/loginsuccess";
        }
        return "user/join";
    }

};
