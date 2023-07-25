package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemService;
import com.choongang.OriMarket.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BusinessStoreController {

    @Autowired
    private final BusinessStoreService businessStoreService;
    private final ItemService itemService;
    private final BusinessUserRepository businessUserRepository;

    @GetMapping("/storenotice1")
    public String storenotice1(){
        return "business/storenotice_new";
        }


    @PostMapping("/storenotice1")
    public String storenoticesave(@ModelAttribute BusinessStore businessStore, HttpSession session,Model model){
        businessStoreService.save(businessStore,session,model);

        // businessStore 객체를 Model에 추가하여 business_manage.jsp에서 사용할 수 있도록 함 테스트중
        model.addAttribute("businessStore", businessStore);

        return "business/storenotice_new";
    }

    //7.23 전체메뉴의 가게관리연결
    @GetMapping("/business_manage")
    public String businessManage() {

        return "business/businessManage/business_manage";
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
    public String updateMenu(@ModelAttribute Item formItem,Model model,HttpSession session) {

        Item updateItem = itemService.getItem(formItem.getItemId());


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





};
