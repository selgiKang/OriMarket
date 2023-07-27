package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.RealTimeStatus.RealTimeRepository;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import com.choongang.OriMarket.order.Order;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ManagerController {

    @Autowired
    private final ManagerService managerService;
    private final RealTimeRepository realTimeRepository;

    //로그인 페이지
    @GetMapping("/managerLogin")
    public String login(){
        return "manager/manager_login";
    }

    //회원가입 페이지
    @GetMapping("/managerJoin")
    public String join(){
        return "manager/manager_join";
    }

    //로그아웃
    @GetMapping("/manager_logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "manager/manager_login";
    }
    //마이 페이지
    @GetMapping("/manager_mypage")
    public String managerInfo(Model model,HttpSession session){
        ManagerUser managerInfoResult = managerService.findByManagerId(model,session);
        System.out.println(managerInfoResult.getManagerName());
        model.addAttribute("managerInfoResult",managerInfoResult);
        return "manager/manager_info_list";
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
            ManagerUser userResult = managerService.findByManagerId(model,session);
            model.addAttribute("userResult",userResult);

            //매니저가 소속된 시장의 주문만 리스트에 저장
           List<Order> orderList = (List<Order>) model.getAttribute("managerOrderList");
           model.addAttribute("orderList",orderList);

           //불러온 주문의 상태 검색
           List<RealTimeStatus> rtsList = new ArrayList<>();
            Order finalOrder = new Order();

            if(orderList!=null && !orderList.isEmpty()){

                //주문 목록 출력해서
               for(Order orders: orderList){
                   //해당 주문번호의
                   String orderNumber = orders.getOrderNumber();
                   finalOrder.setOrderNumber(orderNumber);

                   //그 주문번호의 상태를 찾아서
                   RealTimeStatus rtsResult = realTimeRepository.findByorderNumber(finalOrder);
                   System.out.println("rts상태"+rtsResult.getRtsOrderIng());
                   if(rtsResult!=null){
                       //넣는다.
                       rtsList.add(rtsResult);
                   }
               }
           }
           model.addAttribute("rtsResult",rtsList);

            return "manager/order_list";
        }
        model.addAttribute("fail",1);
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
