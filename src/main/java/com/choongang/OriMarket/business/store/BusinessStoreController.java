package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BusinessStoreController {

    private final BusinessStoreService businessStoreService;

    @GetMapping("/storenotice1")
    public String storenotice1(){
        return "store/storenotice";
        }


    @PostMapping("/storenotice1")
    public String storenoticesave(@ModelAttribute BusinessStore businessStore, HttpSession session){
        businessStoreService.save(businessStore,session);
        return "store/storenotice";
    }




};
