package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BusinessUserController {

    @Autowired
    private final BusinessUserService businessUserService;

    @GetMapping("/login1")
    public String login1(){return "business/businessUser/businesslogin";}

    @GetMapping("/join1")
    public String join1(){return "business/businessUser/businessjoin";}

    @PostMapping("/login1")
    public String loginId(@ModelAttribute BusinessUser businessUser, Model model, HttpSession session) {
        boolean isTrue = businessUserService.login1(businessUser,session);
        if(isTrue){
            return "store/storenotice";
        }
        return "business/businessUser/businesslogin";
    }

    @PostMapping("/join1")
    public String joinUser(@ModelAttribute BusinessUser businessUser, HttpSession session) {
        if(businessUserService.join1(businessUser,session)){
            return "business/businessUser/businesslogin";
        }
        return "business/businessUser/businessjoin";
    }

    @GetMapping("/buUserId/{buUserId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String buUserId) {
        return ResponseEntity.ok(businessUserService.checkBuId(buUserId));
    }


};
