package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.RealTimeStatus.RealTimeRepository;
import com.choongang.OriMarket.RealTimeStatus.RealTimeService;
import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.order.NewOrderRepository;
import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderService;
import com.choongang.OriMarket.user.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    private final OrderService orderService;
    private final NewOrderRepository newOrderRepository;
    private final RealTimeService realTimeService;

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

    @GetMapping("/findManagerId")
    public String findUserId(){return "manager/find_manager_id";}

    @GetMapping("/managerMain")
    public String managerMain(HttpSession session, Model model){

        session.getAttribute("managerId");

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

    //주문 상세 내역
    @GetMapping("/manager_receiptDelivery")
    public String manager_receiptDelivery(@RequestParam("orderNumber")String orderNumber,HttpSession session,Model model){

        Order resultPastOrder = orderService.getOrderNumberList(orderNumber);
        model.addAttribute("orderDelivery",resultPastOrder);

        return "manager/manager_delivery";
    }

    @GetMapping("/managerUpdate")
    public String managerUpdate(Model model, HttpSession session){
        ManagerUser managerUserResult = managerService.findByManagerId(model,session);
        model.addAttribute("managerUserResult",managerUserResult);
        return "manager/manager_infolist_edit";
    }
    //회원 탈퇴
    @GetMapping("/managerDelete")
    public String buUserDelete(HttpSession session,Model model){
        boolean result = managerService.managerUserDelete(session);

        if(result==false){
            model.addAttribute("deleteError", "탈퇴에 실패했습니다. 다시 시도해주세요.");
        }else{
            model.addAttribute("deleteError", "탈퇴가 완료되었습니다.");
        }
        return "manager/manager_login";
    }
    @PostMapping("/managerUpdate")
    public String managerUpdateResult(@ModelAttribute ManagerUser managerUser, Model model, HttpSession session){
        if(managerService.managerUpdate(managerUser,session)){
            return "redirect:/manager_mypage";
        }else{
            model.addAttribute("managerUpdateError", "수정에 실패했습니다. 다시 시도해주세요.");
        }
        return "redirect:/managerUpdate";
    }

    //아이디 찾기
    @PostMapping("/findManagerId")
    public String findUserIdResult(ManagerUser managerUser, Model model, HttpServletRequest request){

        //이름으로 회원정보 찾아서
        ManagerUser managerUserResult = managerService.getManager(managerUser.getManagerName());

        if(managerUserResult!=null){

            if(managerUserResult.getManagerPhone().equals(managerUser.getManagerPhone())){
                model.addAttribute("managerUserResult",managerUserResult);

            }else{
                request.setAttribute("managerloginError","정보가 틀려습니다. 다시 한번 확인해주세요.");
            }

        }else{
            request.setAttribute("managerloginError","정보가 틀려습니다. 다시 한번 확인해주세요.");
        }

        return "manager/find_manager_id";
    }


    //로그인데
    @PostMapping("/managerLogin")
    public String loginResult(@ModelAttribute ManagerUser managerUser, HttpSession session, Model model){
        boolean result = managerService.loginCheck(managerUser,session);
        // 매니저가 속한 시장의 NewOrder 를 가지고와서 수락/거절 수락을누르면 NewOrder의 상태가 '주문시작' 으로 업데이트하고 매니저seq도 업데이트 해준다.
        if(result){
            session.setAttribute("managerId",managerUser.getManagerId());

            //매니저 정보 가져오기
            ManagerUser userResult = managerService.findByManagerId(model,session);
           //매니저 정보
            model.addAttribute("userResult",userResult);

            //매니저가 소속된 시장의 주문만 리스트에 저장
           model.addAttribute("orderList", model.getAttribute("managerOrderList"));

            return "manager/order_list";
        }
        model.addAttribute("fail","아이디 또는 비밀번호가 틀렸습니다. 확인해주세요.");
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

    @GetMapping("/accept")
    public String orderAccept(@RequestParam("orderNumber") String rOrderNumber,
                              @RequestParam("managerUser") String managerSeq,
                              NewOrder orders, HttpSession session, ManagerUser managerUser, Model model) {

        managerUser.setManagerSeq(Long.valueOf(managerSeq));


        if (newOrderRepository.findByOrderNumber(rOrderNumber) == null) {
            model.addAttribute("statusMessage", "주문이 없습니다.");
        } else {
            NewOrder orderToUpdate = newOrderRepository.findByOrderNumber(rOrderNumber);
            orderToUpdate.setOrderNumber(rOrderNumber);
            orderToUpdate.setManagerUser(managerUser);
            orderToUpdate.setOrderStatus("주문 수락");
            newOrderRepository.save(orders);
        }


        String managerId = session.getAttribute("managerId").toString();

        //매니저 정보 가져오기
        ManagerUser userResult = managerService.findByManagerId(model, session);
        model.addAttribute("userResult", userResult);

        //매니저가 소속된 시장의 주문만 리스트에 저장
        List<NewOrder> orderList = (List<NewOrder>) model.getAttribute("managerOrderList");
        model.addAttribute("orderList", orderList);

        return "manager/order_list";
    }
}
