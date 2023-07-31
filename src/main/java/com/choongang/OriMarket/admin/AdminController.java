package com.choongang.OriMarket.admin;


import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import com.choongang.OriMarket.business.user.BusinessUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {

    @Autowired
    private final BusinessUserService businessUserService;
    private final BusinessUserRepository businessUserRepository;
    private final BusinessStoreRepository businessStoreRepository;


    //사업자등록현황페이지
    @GetMapping("/a_buser")
    public String buUserAccess(Model model){
        List<BusinessUser> busers = businessUserRepository.findAll();
        model.addAttribute("busers",busers);

        return "admin/admin_buUser";
    }

    //등록된 사업자 삭제
    @GetMapping("delete_buser/{buUserNumber}")
    public String deleteBuser(@PathVariable("buUserNumber")Long buUserNumber){

        BusinessStore buStore = businessStoreRepository.findByBusinessUser_BuUserNumber(buUserNumber);

        businessStoreRepository.deleteById(buStore.getBuStoreNumber());
        businessUserRepository.deleteById(buUserNumber);

        return "redirect:/admin/a_buUser";
    }
}
