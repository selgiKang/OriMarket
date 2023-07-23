package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemService;
import com.choongang.OriMarket.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BusinessStoreController {

    @Autowired
    private final BusinessStoreService businessStoreService;
    private final ItemService itemService;

    @GetMapping("/storenotice1")
    public String storenotice1(){
        return "business/storenotice_new";
        }



    @PostMapping("/storenotice1")
    public String storenoticesave(@ModelAttribute BusinessStore businessStore, HttpSession session,Model model){
        businessStoreService.save(businessStore,session,model);
        return "business/storenotice_new";
    }

    @GetMapping("/seller_itemDetail/{itemId}")
    public String storeMenu(@PathVariable("itemId")Long itemId,Model model){

        Item item = itemService.getItem(itemId);
        model.addAttribute("item",item);

        return "/store/seller_itemDetail";
    }

    //7.23 전체메뉴의 가게관리연결
    @GetMapping("/business_manage")
    public String businessManage() {

        return "business/businessManage/business_manage";
    }


};
