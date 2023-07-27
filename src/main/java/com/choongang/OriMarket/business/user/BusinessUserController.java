package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketService;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreService;
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

    //7.26 테스트중
//    @GetMapping("/bu_main")
//    public String main(HttpSession session,BusinessUser buUser,Model model) {
//
//
//    }

    @GetMapping("/login1")
    public String login1(){return "business/businessUser/businesslogin";}

    @GetMapping("/join1")
    public String join1(){return "business/businessUser/businessjoin";}

    @PostMapping("/login1")
    public String loginId(@ModelAttribute BusinessUser businessUser, Model model, HttpSession session) {
/*

        //7.26 테스트
        // 사용자가 이미 로그인한 경우, "business/storenotice_new" 페이지로 바로 리다이렉트합니다.
        if (session.getAttribute("buUserId") != null) {
            return "redirect:/business/storenotice_new";
        }
*/

        //사용자 로그인 시도
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
