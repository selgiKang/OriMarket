package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketRepository;
import com.choongang.OriMarket.business.market.MarketService;
import com.choongang.OriMarket.order.*;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.review.ReviewRepository;
import com.choongang.OriMarket.utill.DistanceUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.model.IModel;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequiredArgsConstructor
@Log4j2
public class UserController {

    @Autowired
    private final UserService userService;

    private final UserRepository userRepository;

    private final UserMarketRepository userMarketRepository;

    private final MarketService marketService;

    private final NewOrderRepository newOrderRepository;
    private final NewOrderDetailRepository newOrderDetailRepository;

    private final ReviewRepository reviewRepository;


    // 로그인 get , post 매핑
    @GetMapping("/login")
    public String login() {
        return "user/login";
    }
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

    // join get, Post 매핑
    @GetMapping("/join")
    public String join() {
        return "user/join";
    }

    @PostMapping("/join")
    public String joinUser(@ModelAttribute User user, HttpSession session) {

        if(userService.join(user,session)){
            return "user/mypage";
        }
        return "user/join";
    }


    // update get, Post 매핑
    @GetMapping("/update")
    public String update() {
        return "user/user_infolist_edit";
    }

    //라이더 테스트용으로 잠시 만들어 놨습니다..
    @GetMapping("/riderfirstscreen")
    public String riderfirstscreen() {
        return "rider/rider_firstscreen";
    }

    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user, HttpSession session){

        if(userService.join(user,session)){
            return "user/user_infolist";
        }
        return "user/user_infolist_edit";
    }


    @GetMapping("/infolist")
    public String list() {
        return "user/user_infolist";
    }


    @GetMapping("/review")
    public String review(HttpSession session,Model model) {
        if(session.getAttribute("userSeq")==null){
            return "error/login_error";
        }else {
            User byId = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
            List<NewOrder> newOrders = newOrderRepository.findByOrderStatusAndUserOrderByCreatedDateDesc("배달완료", byId);
            List<Review> reviews = byId.getReviews();

            Collections.reverse(reviews);

            model.addAttribute("re", reviews);
            model.addAttribute("newOrders",newOrders);

            return "store/delivery_pickup";
        }
    }

    @GetMapping("/mypage")
    public String mypage() {
        return "user/mypage";
    }

    @GetMapping("/findUserId")
    public String findUserId(){return "user/findID";}

    @PostMapping("/findUserId")
    public String findUserIdResult(User user, Model model, HttpServletRequest request){
        User userInfo = userService.getUser(user.getUserId());

        if(userInfo!=null){
            if(userInfo.getUserPhone().equals(user.getUserPhone())){
                model.addAttribute("userInfo",userInfo);
            }else{
                request.setAttribute("loginError","정보가 틀려습니다. 다시 한번 확인해주세요.");
            }
        }else{
            request.setAttribute("loginError","정보가 틀려습니다. 다시 한번 확인해주세요.");
        }

        return "user/findID";
    }

    @GetMapping("/findUserPw")
    public String findUserPw(){return "user/findID";}

    @PostMapping("/findUserPw")
    public String findUserPwResult(User user, Model model, HttpServletRequest request){
        User userInfo = userService.getUser(user.getUserEmail());

        if(userInfo!=null){
            if(userInfo.getUserPhone().equals(user.getUserPhone())){
                model.addAttribute("userInfo",userInfo);
            }else{
                request.setAttribute("loginError","정보가 틀려습니다. 다시 한번 확인해주세요.");
            }
        }else{
            request.setAttribute("loginError","정보가 틀려습니다. 다시 한번 확인해주세요.");
        }

        return "user/findID";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "main/main";

    }

    //아이디 중복확인
    @GetMapping("/userId/{userId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String userId){
        return ResponseEntity.ok(userService.checkUserId(userId));
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("userSeq") Long userSeq,Model model){
        System.out.println("번호: "+userSeq);
        boolean userDeleteResult = userService.delete(userSeq);
        if(userDeleteResult==false){
            model.addAttribute("deleteError", "탈퇴에 실패했습니다. 다시 시도해주세요.");
        }else{
            model.addAttribute("deleteError", "탈퇴가 완료되었습니다.");
        }
        return "main/main";
    }

    @PostMapping("/order_list")
    public String order_list(@ModelAttribute User user){
        System.out.println(user.getUserSeq());
        userService.delete(user.getUserSeq());
        return "user/order_list";
    }

    @GetMapping("/deleteUserMarket")
    public String deleteUserMarket(@RequestParam("userMarketSeq") String userMarketSeq,HttpSession session, Model model){
        UserMarket byId = userMarketRepository.findById(Long.valueOf(userMarketSeq)).orElseThrow();
        userMarketRepository.delete(byId);

        if(session.getAttribute("userSeq") != null){
            //유저 번호 찾아서
            Long userSeq = Long.valueOf((session.getAttribute("userSeq")).toString());
            User user= userRepository.findByUserSeq(userSeq);
            model.addAttribute("userMarket", user.getUserMarkets());

            return "main/main";
        }else {
            return "main/main";
        }
    }

    @PostMapping("/usermarketSearch")
    @ResponseBody
    public ResponseEntity<List<Map<String, String>>> usermarketSearch(@RequestParam double latitude, @RequestParam double longitude, Model model, HttpSession session) {
        ;
        try {
            List<Map<String,String>> tableData = new ArrayList<>();
            double radiusInKm = 5.0;
            List<Market> marketsWithinRadius = marketService.findMarketsWithinRadius(latitude, longitude, radiusInKm);

            if(marketsWithinRadius.isEmpty()){
                return ResponseEntity.ok(tableData);
            } else {
                for (Market a : marketsWithinRadius) {
                    Map<String, String> allData = new HashMap<>();
                    //시장 이름만 우선 넣었어요!
                    allData.put("marketName", (a.getMarketName()).toString());
                    // 거리 계산
                    double distance = DistanceUtil.calculateDistance(latitude, longitude, a.getMarketLatitude(), a.getMarketLongitude());
                    allData.put("distance", String.format("%.2f km", distance));

                    System.out.println(a.getMarketName());
                    tableData.add(allData);
                }
                model.addAttribute("tableData", tableData);
                return ResponseEntity.ok(tableData); // 이 위치에서 응답을 한 번만 보냄
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }

    }


};
