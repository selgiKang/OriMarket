package com.choongang.OriMarket.rider;

import com.choongang.OriMarket.order.NewOrder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


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
    public String riderLogin1(@ModelAttribute Rider rider, HttpSession session, Model model){
        if(riderService.riderLogin(rider, session,model)){
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

    @GetMapping("/rider_order_search")
    public String riderOrderSearch(Model model){
        List<NewOrder> orders = riderService.riderOrderSearch();
        model.addAttribute("orders",orders);
        return "rider/rider_main";
    }

    @GetMapping("/rider_order_accept")
    public String riderOrderAccept(@RequestParam("orderNumber") String orderNumber,Model model,HttpSession session){
        NewOrder newOrder = riderService.riderOrderAccept(orderNumber,session);
        model.addAttribute("orderaccept", newOrder);
        return "rider/rider_main";
    }

    @GetMapping("/rider_order_accept1")
    public String riderOrderAccept1(@RequestParam("orderNumber") String orderNumber,Model model,HttpSession session){
        NewOrder newOrder = riderService.riderOrderAccept1(orderNumber,session);
        model.addAttribute("orderaccept1", newOrder);
        return "rider/rider_main";
    }

    @GetMapping("/rider_order_accept2")
    public String riderOrderAccept2(@RequestParam("orderNumber") String orderNumber,Model model,HttpSession session){
        List<NewOrder> newOrders = riderService.riderOrderAccept2(orderNumber, session);
        model.addAttribute("orderaccept2", newOrders);
        return "rider/rider_main";
    }

};
