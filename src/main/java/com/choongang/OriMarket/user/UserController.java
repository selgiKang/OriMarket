package com.choongang.OriMarket.user;

import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderService;
import com.choongang.OriMarket.review.Review;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.model.IModel;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    @Autowired
    private final UserService userService;

    private final UserRepository userRepository;

    //7.18 테스트 데이터 가져오는거까지 성공 승엽
    private final OrderService orderService;

    @GetMapping("/login")
    public String login() {
        return "user/login";
    }
    @GetMapping("/join")
    public String join() {
        return "user/join";
    }
    @GetMapping("/update")
    public String update() {
        return "user/user_infolist_edit";
    }
    @GetMapping("/infolist")
    public String list() {
        return "user/user_infolist";
    }


    @GetMapping("/review")
    public String review(HttpSession session,Model model) {
        User byId = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
        List<Review> reviews = byId.getReviews();
        model.addAttribute("re",reviews);
        return "user/user_reviewlist";
    }

    @GetMapping("/mypage")
    public String mypage() {
        return "user/mypage";
    }


 /*   @GetMapping("/order_list")
    public String getOrderList(Model model) {
        List<Order> orderList = orderService.getAllOrders();
        model.addAttribute("orders", orderList);
        return "store/order_list";
    }*/

/*
기존 로그인
    @PostMapping("/login")
    public String loginId(@ModelAttribute User user, Model model, HttpSession session) {
        boolean isTrue = userService.login(user, session, model);
        if (isTrue) {
            User findUser = userRepository.findByUserId(String.valueOf(session.getAttribute("userId")));
            List<UserAddress> userAddresses = findUser.getUserAddresses();
            model.addAttribute("userAd", userAddresses);
            model.addAttribute("userId", user.getUserId());
            return "main/main";
        } else {
            model.addAttribute("loginError", "아이디 또는 비밀번호가 틀립니다.");
            return "user/login";
        }
    }
*/
/* 모달로그인 230724 */
@PostMapping("/login")
public ResponseEntity<String> loginId(@RequestBody Map<String, String> loginData, HttpSession session, Model model) {
    String userId = loginData.get("userId");
    String userPassword = loginData.get("userPassword");
    User user = new User();
    user.setUserId(userId);
    user.setUserPassword(userPassword);

    boolean isTrue = userService.login(user, session, model);

    if (isTrue) {
        User findUser = userRepository.findByUserId(String.valueOf(session.getAttribute("userId")));
        List<UserAddress> userAddresses = findUser.getUserAddresses();
        model.addAttribute("userAd", userAddresses);
        model.addAttribute("userId", user.getUserId());

        // 로그인 성공 시, 세션 설정 및 응답 반환
        session.setAttribute("userId", userId);
        return ResponseEntity.ok().body("로그인 성공");
    } else {
        // 로그인 실패 시, 오류 메시지와 함께 응답 반환
        model.addAttribute("loginError", "아이디 또는 비밀번호가 틀립니다.");
        return ResponseEntity.badRequest().body("아이디 또는 비밀번호가 틀립니다.");
    }
}

    @PostMapping("/join")
    public String joinUser(@ModelAttribute User user, HttpSession session) {
        if(userService.join(user,session)){
            return "user/login";
        }
        return "user/join";
    }

    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user, HttpSession session){

        if(userService.join(user,session)){
            return "user/user_infolist";
        }
        return "user/user_infolist_edit";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "main/main";

    }

    @GetMapping("/userId/{userId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String userId){
        return ResponseEntity.ok(userService.checkUserId(userId));
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("userSeq") Long userSeq){
        System.out.println("번호: "+userSeq);
        userService.delete(userSeq);
        return "user/login";
    }

    @PostMapping("/order_list")
    public String order_list(@ModelAttribute User user){
        System.out.println(user.getUserSeq());
        userService.delete(user.getUserSeq());
        return "user/order_list";
    }


};
