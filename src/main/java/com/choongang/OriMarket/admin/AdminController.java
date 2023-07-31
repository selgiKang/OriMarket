package com.choongang.OriMarket.admin;

import com.choongang.OriMarket.business.user.BusinessUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {

    @Autowired
    private final BusinessUserService businessUserService;


    //사업자등록현황페이지
    @GetMapping("/a_buser")
    public String buUserAccess(){
        return "admin/admin_buUser";
    }

    
}
