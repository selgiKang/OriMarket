package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketService;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BusinessUserController {

    @Autowired
    private BusinessUserService businessUserService;

    private final BusinessUserRepository businessUserRepository;

    //7.26 테스트중
    @GetMapping("/bu_main")
    public String main(HttpSession session, Model model) {

        if(session.getAttribute("buUserId") != null){

            String buUserId = String.valueOf((session.getAttribute("buUserId")).toString());
            BusinessUser businessUser= businessUserRepository.findByBuUserId(buUserId);
            //model.addAttribute("userMarket", user.getUserMarkets());

            return "business/storenotice_new";
        }else {
            return "business/storenotice_new";
        }
    }

    @GetMapping("/login1")
    public String login1(){return "business/businessUser/businesslogin";}

    @GetMapping("/join1")
    public String join1(){return "business/businessUser/businessjoin";}

    @PostMapping("/login1")
    public String loginId(@ModelAttribute BusinessUser businessUser, Model model, HttpSession session) {
        boolean isTrue = businessUserService.login1(businessUser, session, model);
        if (isTrue) {
            session.setAttribute("buUserId", businessUser.getBuUserId());
            System.out.println(session.getAttribute("buUserId"));
            return "business/storenotice_new";


        } else {
            // If login fails, add an error message to the model
            model.addAttribute("loginError", "아이디 또는 비밀번호가 틀립니다.");
            return "business/businessUser/businesslogin";
        }
    }


    @PostMapping("/join1")
    public String joinUser(@ModelAttribute BusinessUser businessUser,HttpSession session) {
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
