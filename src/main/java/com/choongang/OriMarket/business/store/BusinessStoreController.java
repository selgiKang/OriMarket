package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
    public String storenoticesave(@ModelAttribute BusinessStore businessStore){
        businessStoreService.save(businessStore);
        return "store/storenotice";
    }




};
