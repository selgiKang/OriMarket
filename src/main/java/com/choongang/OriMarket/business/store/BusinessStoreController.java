package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemService;
import com.choongang.OriMarket.store.Store;
import com.choongang.OriMarket.utill.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.awt.print.Pageable;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.Map;

import static com.choongang.OriMarket.utill.Constant.IMAGE_PATH;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BusinessStoreController {

    @Autowired
    private final BusinessStoreService businessStoreService;
    private final BusinessStoreRepository businessStoreRepository;
    private final ItemService itemService;
    private final BusinessUserRepository businessUserRepository;
    private final ImageService imageService;


    @GetMapping("/storenotice1")
    public String storenotice1(HttpSession session,BusinessUser buUser,Model model){

        if(session.getAttribute("buUserNumber") != null){
            Long buUserNumber = Long.valueOf(session.getAttribute("buUserNumber").toString());
            System.out.println(buUserNumber);

            buUser.setBuUserNumber(buUserNumber);

            BusinessStore buStoreResult = businessStoreService.findUserStore(buUser,model);
            model.addAttribute("save",buStoreResult);
            return "business/storenotice_new";

        }else {

            return "business/storenotice_new";
        }

    }

    @PostMapping("/storenotice1")
    public String storenoticesave(@ModelAttribute BusinessStore businessStore, HttpSession session,Model model, @RequestParam("pictureUrl") MultipartFile file) throws IOException {

        if(file.isEmpty()){
            if(businessStore.getBuStoreNumber() != null){
                BusinessStore businessStore1 = businessStoreRepository.findById(businessStore.getBuStoreNumber()).orElseThrow();
                String s = businessStore1.getBuStoreImageUrl();
                businessStoreService.save(businessStore, session, model, s);
            }
        }else {
            String s = imageService.saveStoreImage(file);
            businessStoreService.save(businessStore, session, model, s);
        }
        return "business/storenotice_new";
    }

    /*물건리스트에서 상세로*/
    @GetMapping("/seller_itemDetail/{itemId}")
    public String storeMenu(@PathVariable("itemId")Long itemId,Model model){

        Item item = itemService.getItem(itemId);
        model.addAttribute("items",item);

        return "/store/seller_itemDetail";
    }

    //등록된 item수정하기
    @PostMapping("/update_itemDetail")
    public String updateMenu(@ModelAttribute Item formItem,Model model,HttpSession session,@RequestParam("pictureUrl") MultipartFile file) throws IOException {

        Item updateItem = itemService.getItem(formItem.getItemId());

        if(file.isEmpty()){
            updateItem.setItemImageUrl(updateItem.getItemImageUrl());
        }else {
            String s = imageService.saveItemImage(file);
            updateItem.setItemImageUrl(s);
        }

        updateItem.setItemName(formItem.getItemName());
        updateItem.setItemCnt(formItem.getItemCnt());
        updateItem.setItemG(formItem.getItemG());
        updateItem.setItemFrom(formItem.getItemFrom());
        updateItem.setItemCategory(formItem.getItemCategory());
        updateItem.setItemPrice(formItem.getItemPrice());
        updateItem.setItemCost(formItem.getItemCost());
        updateItem.setItemInfo(formItem.getItemInfo());


        itemService.update(updateItem);

        BusinessUser buUserNumber = businessUserRepository.findById((Long) session.getAttribute("buUserNumber")).orElseThrow();
        List<Item> items1 = buUserNumber.getBusinessStores().get(0).getItems();
        model.addAttribute("items",items1);


        return "/store/seller_itemList";
    }


    //등록된 아이템 삭제(cartItem테이블에서도 삭제되게)
    @DeleteMapping("/delete_items")
    @ResponseBody
    public String deleteSelectedItems(@RequestParam("itemIds[]")  List<Long> itemIds) {
        for(Long deleteItemId :itemIds){
            itemService.deleteItems(deleteItemId);
        }
        return "success";
    }



    //7.23 전체메뉴의 가게관리연결
    @GetMapping("/business_manage")
    public String businessManage(HttpSession session,Model model) {
        BusinessUser buUserId = businessUserRepository.findByBuUserId((String) session.getAttribute("buUserId"));
        List<BusinessStore> businessStores = buUserId.getBusinessStores();
        if (businessStores.isEmpty()) {
        } else {
            model.addAttribute("save", businessStores.get(0));
        }
        return "business/businessManage/business_manage";
    }

    @GetMapping("/business_manage1")
    public String businessManage1(HttpSession session,Model model) {

        return "business/businessManage/business_manage";
    }


    @PostMapping("/storeStatus")
    public String storeStauts(@ModelAttribute BusinessStore businessStore){
        BusinessStore byId = businessStoreRepository.findById(businessStore.getBuStoreNumber()).orElseThrow();
        System.out.println("현재상태:"+businessStore.getStatus());
        if(businessStore.getStatus() == null){
            byId.setStatus("CLOSE");
            businessStoreRepository.save(byId);
        }else{
            byId.setStatus(businessStore.getStatus());
            businessStoreRepository.save(byId);
        }
        return "redirect:/storenotice1";
    }

};
