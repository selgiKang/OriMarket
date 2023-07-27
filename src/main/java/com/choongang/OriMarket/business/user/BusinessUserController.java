package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketService;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.store.BusinessStoreService;
import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BusinessUserController {

    @Autowired
    private BusinessUserService businessUserService;
    private final BusinessUserRepository businessUserRepository;
    private final BusinessStoreRepository businessStoreRepository;

    @GetMapping("/login1")
    public String login1(){
        return "business/businessUser/businesslogin";
    }
    @GetMapping("/buUserLogout")
    public String buUserLogout(@RequestParam("buUserId") String buUserId,HttpSession session){

        if(businessUserRepository.findByBuUserId(buUserId)!=null){
            BusinessUser byId = businessUserRepository.findByBuUserId(buUserId);
            BusinessStore businessStore = byId.getBusinessStores().get(0);
            businessStore.setStatus("CLOSE");
            businessStoreRepository.save(businessStore);
        }

        session.invalidate();
        return "business/businessUser/businesslogin";
    }

    @GetMapping("/join1")
    public String join1(){return "business/businessUser/businessjoin";}

    //회원정보
    @GetMapping("/infolist1")
    public String list(HttpSession session,Model model) {
        BusinessUser buUserResult = businessUserService.buUserNumber(session);
        model.addAttribute("buUserResult",buUserResult);
        return "business/businessUser/businessuser_infolist";
    }
    @GetMapping("/buUserId/{buUserId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String buUserId) {
        return ResponseEntity.ok(businessUserService.checkBuId(buUserId));
    }

    @GetMapping("/buUserUpdate")
    public String buUserUpdate(HttpSession session,Model model){
        BusinessUser buUserResult = businessUserService.buUserNumber(session);
        model.addAttribute("buUserResult",buUserResult);
        return "business/businessUser/businessuser_infolist_edit";
    }

    @GetMapping("/buUserDelete")
    public String buUserDelete(HttpSession session,Model model){
        boolean result = businessUserService.buUserDelete(session);

        if(result==false){
            model.addAttribute("deleteError", "탈퇴에 실패했습니다. 다시 시도해주세요.");
        }else{
            model.addAttribute("deleteError", "탈퇴가 완료되었습니다.");
        }

        return "business/businessUser/businesslogin";
    }
    @PostMapping("/buUserUpdate")
    public String updateResult(@ModelAttribute BusinessUser user,Model model,HttpSession session){
        if(businessUserService.buUserUpdate(user,session)){
            return "redirect:/infolist1";
        }else{
            model.addAttribute("updateError", "수정에 실패했습니다. 다시 시도해주세요.");
        }
        return "redirect:/buUserUpdate";
    }

    @PostMapping("/login1")
    public String loginId(@ModelAttribute BusinessUser businessUser, Model model, HttpSession session) {

        //사용자 로그인 시도
        if (businessUserService.login1(businessUser, session, model)) {
            session.setAttribute("buUserId", businessUser.getBuUserId());
            System.out.println(session.getAttribute("buUserId"));
            return "business/storenotice_new";

        } else {
            model.addAttribute("loginError", "아이디 또는 비밀번호가 틀립니다.");
            return "business/businessUser/businesslogin";
        }
    }


    @PostMapping("/join1")
    public String joinUser(@ModelAttribute BusinessUser businessUser,HttpSession session) {
        if(businessUserService.join1(businessUser,session)){
            return "business/businessUser/businesslogin";
        }
        return "business/businessUser/businessjoin";
    }

};
