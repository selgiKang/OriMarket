package com.choongang.OriMarket.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.model.IModel;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

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
        return "user/user_infolist_edit";
    }
    @GetMapping("/infolist")
    public String list() {
        return "user/user_infolist";
    }

    @GetMapping("/review")
    public String review() {
        return "user/user_review";
    }


    @GetMapping("/mypage")
    public String mypage() {
        return "user/mypage";
    }

    @GetMapping("/cart")
    public String cart() {
        return "user/cart";
    }

    @GetMapping("/order_list")
    public String order_list() {
        return "user/order_list";
    }

    @PostMapping("/login")
    public String loginId(@ModelAttribute User user, Model model, HttpSession session) {
        boolean isTrue = userService.login(user,session);
        if(isTrue){
            model.addAttribute("userId", user.getUserId());
            return "main/main";
        }
        return "user/login";
    }

    @PostMapping("/join")
    public String joinUser(@ModelAttribute User user, HttpSession session) {
        if(userService.join(user,session)){
            return "user/login";
        }
        return "user/join";
    }

    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user, HttpSession session){

        if(userService.join(user,session)){
            return "user/user_infolist";
        }
        return "user/user_infolist_edit";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "main/main";

    }

    @GetMapping("/userId/{userId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String userId){
        return ResponseEntity.ok(userService.checkUserId(userId));

    }

    @GetMapping("/delete")
    public String deleteUser(@ModelAttribute User user){
        System.out.println(user.getUserSeq());
        userService.delete(user.getUserSeq());
        return "user/login";
    }

    @PostMapping("/order_list")
    public String order_list(@ModelAttribute User user){
        System.out.println(user.getUserSeq());
        userService.delete(user.getUserSeq());
        return "user/order_list";
    }


};
