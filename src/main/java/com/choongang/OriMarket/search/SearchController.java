package com.choongang.OriMarket.search;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreService;
import com.choongang.OriMarket.store.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SearchController {

    @Autowired
    private final ItemService itemService;
    private final BusinessStoreService businessStoreService;


    @GetMapping("/header_search1")
    public String header_search(@RequestParam(value = "searchKeyword") String searchKeyword, Model model){
        List<BusinessStore> businessStores = businessStoreService.searchStore(searchKeyword);
        for (BusinessStore store:businessStores){
            System.out.println("확인용: "+store.getBuStoreName());
        }
        List<Item> items = itemService.searchItem(searchKeyword);
        for( Item item:items){
            System.out.println("확인용2: "+item.getItemName());
        }
        model.addAttribute("st123",businessStores);
        model.addAttribute("it1",items);


        return "user/test";
    }


}

