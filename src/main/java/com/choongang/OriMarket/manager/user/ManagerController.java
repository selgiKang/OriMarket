package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.order.NewOrderRepository;
import com.choongang.OriMarket.order.OrderService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
@Log4j2
public class ManagerController {

    @Autowired
    private final ManagerService managerService;
    private final NewOrderRepository newOrderRepository;
    private final OrderService orderService;
    private final ManagerRepository managerRepository;

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


    //배달완료 page
    @GetMapping("/orderListResult")
    @ResponseBody
    public Page<NewOrder> orderListResult(@RequestParam("page") int pageNumber,Model model,HttpSession session) {

        HashMap<String, Object> result = new HashMap<>();

        //매니저가 소속된 시장의 주문만 리스트에 저장
        List<NewOrder> orderList = (List<NewOrder>) model.getAttribute("managerOrderList");
        model.addAttribute("orderList",orderList);
        System.out.println("페이지번호"+pageNumber);
        int pageNumbe1 = pageNumber;
        int pageSize = 4; // 한 페이지에 4개씩 보여줄 때
        Pageable pageable = PageRequest.of(pageNumbe1, pageSize);
        String orderStatus = "배달완료";
        String orderStatusNo ="주문거절";
        Page<NewOrder> resultPage = orderService.pageList((String)session.getAttribute("managerId"), orderStatus, orderStatusNo,pageable);
        for(NewOrder n:resultPage){
            System.out.println("ajax: "+n.getOrderNumber());
        }
        System.out.println("여기까지왔따.");
        return resultPage;
    }

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
        List<NewOrder> orderList = (List<NewOrder>) model.getAttribute("managerOrderList");
        model.addAttribute("orderList",orderList);

        int pageNumber = 0; // 2번째 페이지를 가져올 때는 1을 사용 (0부터 시작)
        int pageSize = 4; // 한 페이지에 4개씩 보여줄 때
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        String orderStatus = "배달완료";
        String orderStatusNo ="주문거절";
        Page<NewOrder> resultPage = orderService.pageList(userResult.getManagerId(), orderStatus, orderStatusNo,pageable);
        model.addAttribute("resultPage",resultPage);

        return "manager/order_list";
    }
    //주문 상세 내역
    @GetMapping("/manager_receiptDelivery")
    public String manager_receiptDelivery(@RequestParam("orderNumber")String orderNumber,HttpSession session,Model model){

        NewOrder resultPastOrder = newOrderRepository.findByOrderNumber(orderNumber);
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

            int pageNumber = 0; // 2번째 페이지를 가져올 때는 1을 사용 (0부터 시작)
            int pageSize = 4; // 한 페이지에 4개씩 보여줄 때
            Pageable pageable = PageRequest.of(pageNumber, pageSize);
            String orderStatus = "배달완료";
            String orderStatusNo ="주문거절";
            Page<NewOrder> resultPage = orderService.pageList(userResult.getManagerId(), orderStatus, orderStatusNo,pageable);
            model.addAttribute("resultPage",resultPage);

            return "manager/order_list";
        }else{
            model.addAttribute("fail","아이디 또는 비밀번호가 틀렸습니다. 확인해주세요.");
        }
        return "manager/manager_login";
    }

    @PostMapping("/manager_order_search")
    public String orderSearch(@ModelAttribute ManagerUser managerUser, HttpSession session, Model model){

        if(managerService.findByManagerId(model,session)!=null){
            //매니저 정보 가져오기
            ManagerUser userResult = managerService.findByManagerId(model,session);
            //매니저 정보
            model.addAttribute("userResult",userResult);

            //매니저가 소속된 시장의 주문만 리스트에 저장
            model.addAttribute("orderList", model.getAttribute("managerOrderList"));

            int pageNumber = 0; // 2번째 페이지를 가져올 때는 1을 사용 (0부터 시작)
            int pageSize = 4; // 한 페이지에 4개씩 보여줄 때
            Pageable pageable = PageRequest.of(pageNumber, pageSize);
            String orderStatus = "배달완료";
            String orderStatusNo ="주문거절";
            Page<NewOrder> resultPage = orderService.pageList(userResult.getManagerId(), orderStatus, orderStatusNo,pageable);
            model.addAttribute("resultPage",resultPage);

            return "manager/order_list";
        }else{
            model.addAttribute("pleaseLogin","로그인해주세요.");
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

    //매니저 회원 CRUD 관리
    @GetMapping("/managercrud")
    public String managercrud(Model model) {
        List<ManagerUser> managerUsers = managerService.getAllManagerUsers();

        for (ManagerUser managerUser:managerUsers){
            System.out.println("매니저:"+managerUser.getManagerName());
        }
        model.addAttribute("managerUsers",managerUsers);
        return "admin/admin_manager";
    }

    // 거절 누르면
    @GetMapping("/reject")
    public String orderReject(@RequestParam("orderNumber") String rOrderNumber,
                              @RequestParam("managerUser") String managerSeq,
                              NewOrder orders, HttpSession session, ManagerUser managerUser, Model model) {

        managerUser.setManagerSeq(Long.valueOf(managerSeq));


        if (newOrderRepository.findByOrderNumber(rOrderNumber) == null) {
            model.addAttribute("statusMessage", "주문이 없습니다.");
        } else {
            NewOrder orderToUpdate = newOrderRepository.findByOrderNumber(rOrderNumber);
            orderToUpdate.setOrderNumber(rOrderNumber);
            orderToUpdate.setManagerUser(managerUser);
            orderToUpdate.setOrderStatus("주문거절");
            newOrderRepository.save(orderToUpdate);
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
            orderToUpdate.setOrderStatus("주문수락");
            newOrderRepository.save(orderToUpdate);
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

    @GetMapping("/acceptPickup")
    public String acceptPickup(NewOrder order, HttpSession session, Model model) {

        if (managerService.findByManagerId(model, session) == null) {
            model.addAttribute("statusMessage", "주문이 없습니다.");
        } else {
            NewOrder orderToUpdate = newOrderRepository.findByOrderNumber(order.getOrderNumber());
            orderToUpdate.setOrderStatus("픽업완료");
            newOrderRepository.save(orderToUpdate);
        }
        //매니저 정보 가져오기
        ManagerUser userResult = managerService.findByManagerId(model, session);
        model.addAttribute("userResult", userResult);

        //매니저 정보
        List<NewOrder> orderList = (List<NewOrder>) model.getAttribute("managerOrderList");
        model.addAttribute("orderList", orderList);

        return "manager/order_list";
    }
}
