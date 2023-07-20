package com.choongang.OriMarket.manager.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ManagerController {

    @Autowired
    private final ManagerService managerService;

    @GetMapping("/managerMain")
    public String main(){return "manager/manager_main";
    }
    @GetMapping("/managerLogin")
    public String login(){
        return "manager/manager_login";
    }

    @GetMapping("/managerJoin")
    public String join(){
        return "manager/managerjoin";
    }

    @GetMapping("/managerId/{managerId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String managerId) {
        return ResponseEntity.ok(managerService.checkManagerId(managerId));
    }


    @PostMapping("/managerLogin")
    public String loginResult(@ModelAttribute ManagerUser managerUser, HttpSession session){
        boolean result = managerService.loginCheck(managerUser,session);
        if(result){
            session.setAttribute("managerId",managerUser.getManagerId());
            return "manager/manager_main";
        }
        return "manager/manager_login";
    }

    @PostMapping("/managerJoin")
    public String joinResult(@ModelAttribute ManagerUser managerUser, HttpSession session){
        if(managerService.join(managerUser,session)){
            return "manager/manager_login";
        }
        return "manager/manager_login";
    }

}
