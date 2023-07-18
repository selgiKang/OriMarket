package com.choongang.OriMarket.store;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class StoreController {

    @Autowired
    private final StoreService storeService;

    private final  ItemService itemService;

    @GetMapping("/detailmenu")
    public String store_detailmenu() {
        return "store/detailmenu";
    }

    // /store getMapping은 favController로 이동
    @GetMapping("/store_menu_search")
    public String store_menu_search() {


        return "store/store_menu_search";
    }

    @GetMapping("/storenotice")
    public String storenotice() {
        return "store/storenotice";
    }

    @GetMapping("/s")
    public String storenotice1() {
        return "store/seller_itemDetail";
    }

    @GetMapping("/s1")
    public String storenotice2() {
        return "store/seller_itemList";
    }

    @GetMapping("/s2")
    public String storenotice3() {
        return "store/seller_itemRegister";
    }

    @PostMapping("/s2")
    public String storenotice31(@ModelAttribute Item item, HttpSession session, Model model){
        itemService.save(item,session,model);
        return "store/seller_itemList";
    }

    @GetMapping("/s3")
    public String storenotice4() {
        return "store/seller_manageMenu";
    }


    @GetMapping("/test")
    public String test() {
        return "store/test";
    }

    @GetMapping("/store_menuedit")
    public String store_menuedit(){return "store/store_menuedit";}

    @PostMapping("/storenotice")
    public String storenoticeStore(@ModelAttribute Store store){
        System.out.println("가게이름: "+store.getStoreName());
        Store storeupdate = storeService.update(store);

        System.out.println("가게이름: " +storeupdate.getStoreName());

        if(storeupdate == null){
            return "store/store";
        }else {
            return "store/storenotice";
        }

    }

};
