//package com.choongang.OriMarket.user;
//
//import ch.qos.logback.core.encoder.EchoEncoder;
//import lombok.RequiredArgsConstructor;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.validation.FieldError;
//import org.springframework.validation.annotation.Validated;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpSession;
//import javax.validation.Valid;
//import java.security.Principal;
//import java.util.List;
//
//
//@Controller
//@RequiredArgsConstructor
//public class CartController {
//
//    @Autowired
//    private final CartService cartService;
//
////받아와야하는 값
////세션에 저장한 값? 현재 주소, 시장이름
////cartId,cartItemId로 가져와야하는 값?  가게이름,상품명,수량,가격
//
////상품상세페이지에서 장바구니담기 버튼 >>> 수량과 item정보를 controller로 넘겨받는다. >>> POST >>> addCart
////푸터에 존재하는 장바구니 가기 버튼 >>> GET >>> 카트에 저장된 CartItem정보를 controller에서 보낸다 >>>jsp
//
//   @GetMapping("/cart/{userId}")
//    public String cartPage(@RequestParam("userId") String id, HttpSession session,Model model) {
//
//       /*로그인되어있는 유저에 해당하는 장바구니 가져오기*/
//
//       /*장바구니에 들어있는 아이템 모두 가져오기*/
//
//       /*장바구니에 들어있는 상품들의 총 가격*/
//
//       /*model.addAttribute 로 가격,수량,cartItems,user 저장*/
//
//       return "user/cart";
//   }
//
//
//
//    @PostMapping(value = "/cart")
//    public @ResponseBody ResponseEntity addCartItem(@RequestBody @Valid CartItem cartItem, BindingResult bindingResult, HttpSession session){
//
//       /*장바구니에 담을 상품 정보를 받는 cartItem객체에 데이터바인딩시 에러가 있는지 검사*/
//        if (bindingResult.hasErrors()){
//            StringBuilder sb = new StringBuilder();
//            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
//            for(FieldError fieldError :  fieldErrors){
//                sb.append(fieldError.getDefaultMessage());
//            }
//            return new ResponseEntity<String>(sb.toString(), HttpStatus.BAD_REQUEST);
//        }
//        /*현재 로그인한 회원의 정보를 변수에 저장 */
//        String userId = (String)session.getAttribute("userId");
//        Long cartItemId;
//
//        try {
//            cartItemId = cartService.addCart(cartItem,userId);
//        }catch(Exception e){
//            return new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
//        }
//        return new ResponseEntity<Long>(cartItemId,HttpStatus.OK);
//    }
//
//
//}