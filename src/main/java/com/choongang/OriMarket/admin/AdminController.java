package com.choongang.OriMarket.admin;


import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import com.choongang.OriMarket.business.user.BusinessUserService;
import com.choongang.OriMarket.store.ItemRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {

    @Autowired
    private final BusinessUserService businessUserService;
    private final BusinessUserRepository businessUserRepository;
    private final BusinessStoreRepository businessStoreRepository;
    private final ItemRepository itemRepository;


    //사업자등록현황페이지
    @GetMapping("/a_buser")
    public String buUserAccess(Model model){

        if(businessUserRepository.findAll()!=null){
            List<BusinessUser> busers = businessUserRepository.findAll();
            model.addAttribute("busers",busers);
        }


        return "admin/admin_buUser";
    }

    @GetMapping("/storeInfo")
    public String buUserStoreInfo(@RequestParam("buUserNumber") String buUserNumber,Model model,BusinessUser businessUser){
        Long buNumber = Long.valueOf(buUserNumber);
        businessUser.setBuUserNumber(buNumber);
        BusinessStore store = businessStoreRepository.findByBusinessUser(businessUser);
        model.addAttribute("storeInfo",store);

        return "admin/storeInfo";
    }
    @PostMapping("/storeInfoDelete")
    public String buUserStoreInfoDelete(@RequestParam("buUserNumber") String buUserNumber,Model model,BusinessUser businessUser){
        Long buNumber = Long.valueOf(buUserNumber);
        businessUser.setBuUserNumber(buNumber);
        BusinessStore store = businessStoreRepository.findByBusinessUser(businessUser);

        if(store.getItems().size()!=0){
            for(int i=0;i<store.getItems().size();i++){
                itemRepository.delete(store.getItems().get(i));
            }
        }
        businessStoreRepository.delete(store);

        model.addAttribute("deleteMessage","삭제되었습니다.");
        return "redirect:/a_buser";
    }
}
