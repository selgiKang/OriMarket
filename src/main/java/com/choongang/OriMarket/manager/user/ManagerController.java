package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.RealTimeStatus.RealTimeRepository;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import com.choongang.OriMarket.order.Order;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ManagerController {

    @Autowired
    private final ManagerService managerService;
    private final RealTimeRepository realTimeRepository;

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

    //아이디 중복 확인
    @GetMapping("/managerId/{managerId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String managerId) {
        return ResponseEntity.ok(managerService.checkManagerId(managerId));
    }



    //로그인
    @PostMapping("/managerLogin")
    public String loginResult(@ModelAttribute ManagerUser managerUser, HttpSession session, Model model){
        boolean result = managerService.loginCheck(managerUser,session);
        if(result){
            session.setAttribute("managerId",managerUser.getManagerId());
            //매니저 정보 가져오기
            ManagerUser userResult = managerService.findByManagerId(managerUser.getManagerId(),model);
            model.addAttribute("userResult",userResult);

            //매니저가 소속된 시장의 주문만 리스트에 저장
           List<Order> orderList = (List<Order>) model.getAttribute("managerOrderList");
           model.addAttribute("orderList",orderList);

           //불러온 주문의 상태 검색
           List<RealTimeStatus> rtsList = new ArrayList<>();

           if(orderList!=null && !orderList.isEmpty()){
               Order finalOrder = null;

               for(Order orders: orderList){

                   String orderNumber = orders.getOrderNumber();
                   finalOrder.setOrderNumber(orderNumber);
                   RealTimeStatus rtsResult = realTimeRepository.findByorderNumber(finalOrder);

                   if(rtsResult!=null){
                       rtsList.add(rtsResult);
                   }
               }
           }
           model.addAttribute("rtsResult",rtsList);

            return "manager/order_list";
        }
        return "manager/manager_login";
    }

    //회원가입
    @PostMapping("/managerJoin")
    public String joinResult(@ModelAttribute ManagerUser managerUser, HttpSession session){
        if(managerService.join(managerUser,session)){
            return "manager/manager_login";
        }
        return "manager/manager_login";
    }

    //매니저 정보에서 시장 정보 빼오기

}
