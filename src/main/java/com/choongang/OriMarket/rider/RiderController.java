package com.choongang.OriMarket.rider;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@Controller
@RequiredArgsConstructor
@Slf4j
public class RiderController {

    @Autowired
    private final RiderService riderService;

    @GetMapping("/rider")
    public String rider(){return "rider/rider_main";}

    @GetMapping("/rider_login")
    public String riderLogin() {
        return "rider/rider_login";
    }

    @PostMapping("/rider_login")
    public String riderLogin1(@ModelAttribute Rider rider,HttpSession session){
        if(riderService.riderLogin(rider, session)){
            return "rider/rider_main";
        }else {
            return "rider/rider_login";
        }
    }

    @GetMapping("/rider_join")
    public String riderJoin() {
        return "rider/rider_join";
    }

    @PostMapping("/rider_join")
    public String riderJoin1(@ModelAttribute Rider rider, HttpSession session) {
        if(riderService.riderJoin(rider,session)){
            return "rider/rider_login";
        }else {
            return "rider/rider_join";
        }
    }
    @GetMapping("/riderId/{riderId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String riderId) {
        return ResponseEntity.ok(riderService.checkRiderId(riderId));
    }

};
