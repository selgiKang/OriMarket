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
@Slf4j
public class BusinessUserController {

    private BusinessUserService businessUserService;
    private MarketService marketService;

    @Autowired
    public void BusinessUserController(BusinessUserService businessUserService,MarketService marketService){
        this.businessUserService=businessUserService;
        this.marketService = marketService;
    }

    @GetMapping("/login1")
    public String login1(){return "business/businessUser/businesslogin";}

    @GetMapping("/join1")
    public String join1(){return "business/businessUser/businessjoin";}

    @PostMapping("/login1")
    public String loginId(@ModelAttribute BusinessUser businessUser, Model model, HttpSession session) {
        boolean isTrue = businessUserService.login1(businessUser,session,model);
        if(isTrue){

            session.setAttribute("buUserId",businessUser.getBuUserId());
            System.out.println(session.getAttribute("buUserId"));
            return "business/storenotice_new";
        }
        return "business/businessUser/businesslogin";
    }

    @PostMapping("/join1")
    public String joinUser(@ModelAttribute BusinessUser businessUser,HttpSession session) {

        Market marketData = marketService.findMarket(businessUser.getMarket().getMarketName());
        businessUser.setMarket(marketData);

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
