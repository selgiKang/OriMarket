package com.choongang.OriMarket.store;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class StoreController {

    @Autowired
    private final StoreService storeService;

    private final  ItemService itemService;

    private final BusinessStoreRepository businessStoreRepository;

    private final BusinessUserRepository businessUserRepository;

    private final ItemRepository itemRepository;

//    @GetMapping("/detailmenu")
//    public String store_detailmenu(){
//        return "store/detailmenu";
//    }

    // /store getMapping은 favController로 이동
    @GetMapping("/search_modal_popup")
    public String store_menu_search() {


        return "store/search_modal_popup";
    }

    @GetMapping("/storenotice")
    public String storenotice() {
        return "store/storenotice";
    }

    @GetMapping("/s")
    public String storenotice1() {
        return "store/seller_itemDetail";
    }

    @GetMapping("/deliverypickup")
    public String deliverypickup() {
        return "store/delivery_pickup";
    }

    @GetMapping("/modalslideup")
    public String modalslideup() {
        return "store/modal_slideup";
    }

    @GetMapping("/modalsearchlist")
    public String modalsearchlist() {
        return "store/search_store_list_final";
    }


    @GetMapping("/s1/{buUserId}")
    public String storenotice2(HttpSession session,Model model,@PathVariable("buUserId")String buUserId) {
        BusinessUser buUserNumber = businessUserRepository.findById((Long) session.getAttribute("buUserNumber")).orElseThrow();
        List<Item> items1 = buUserNumber.getBusinessStores().get(0).getItems();
        model.addAttribute("items",items1);


        BusinessUser businessUser = businessUserRepository.findByBuUserId(buUserId);
        BusinessStore businessStore = businessStoreRepository.findByBuStoreNumber(businessUser.getBusinessStores().get(0).getBuStoreNumber());
        session.setAttribute("buUser",businessUser);
        session.setAttribute("buStore",businessStore);

        return "store/seller_itemList";
    }

    @GetMapping("/s2/{buUserId}")
    public String storenotice3(@PathVariable("buUserId")String buUserId,HttpSession session) {
        BusinessUser businessUser = businessUserRepository.findByBuUserId(buUserId);
        BusinessStore businessStore = businessStoreRepository.findByBuStoreNumber(businessUser.getBusinessStores().get(0).getBuStoreNumber());
        session.setAttribute("buUser",businessUser);
        session.setAttribute("buStore",businessStore);

        return "store/seller_itemRegister";
    }

    @PostMapping("/s2")
    public String storenotice31(@ModelAttribute Item item, HttpSession session, Model model){

        itemService.save(item,session,model);
        System.out.println("이게또실행되나?");
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
    public String storenoticeStore(@ModelAttribute Store store,Model model){
        System.out.println("가게이름: "+store.getStoreName());
        Store storeupdate = storeService.update(store);

        System.out.println("가게이름: " +storeupdate.getStoreName());

        if(storeupdate == null){
            return "store/store";
        }else {
            return "store/storenotice";
        }

    }

    @GetMapping("/storenotice0")
    public String storenotice0(Model model){
        List<Item> all = itemRepository.findAll();
        for(Item item: all){
            System.out.println("zzz"+item.getItemName());
        }
            model.addAttribute("al",all);
        return "store/store";
    }

    @GetMapping("/detailmenu/{itemId}")
    public String store_detailmenu(@PathVariable("itemId")Long itemId,Model model){

        Item item = itemService.getItem(itemId);

        model.addAttribute("item",item);

        return "store/detailmenu";
    }
};
