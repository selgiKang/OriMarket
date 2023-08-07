package com.choongang.OriMarket.search;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreService;
import com.choongang.OriMarket.store.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class SearchController {

    private final ItemService itemService;
    private final BusinessStoreService businessStoreService;


    @GetMapping("/header_search1")
    public String header_search(@RequestParam(value = "searchKeyword") String searchKeyword, Model model) {
        List<BusinessStore> businessStores = businessStoreService.searchStore(searchKeyword);

        List<Item> items = itemService.searchItem(searchKeyword);

        model.addAttribute("st123", businessStores);
        model.addAttribute("it1", items);

        return "test/test";
    }
}

