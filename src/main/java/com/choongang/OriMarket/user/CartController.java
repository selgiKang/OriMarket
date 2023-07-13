//package com.choongang.OriMarket.user;
//
//import com.choongang.OriMarket.store.Item;
//import com.choongang.OriMarket.store.ItemService;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.Banner;
//import org.springframework.security.core.annotation.AuthenticationPrincipal;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import java.util.List;
//
//
//@Controller
//@Slf4j
//public class CartController {
//
//    private final CartService cartService;
//    private final UserService userService;
//    private final ItemService itemService;
//
//    public CartController(CartService cartService, UserService userService,ItemService itemService){
//        this.cartService=cartService;
//        this.userService=userService;
//        this.itemService=itemService;
//    }
//
//
//    /*내 장바구니 조회*/
//    @GetMapping("/user/{userId}/cart")
//    public String myCartPage(@PathVariable("userId") String userId, Model model){
//        Cart cart = cartService.getCart(userId);
//
//        List<CartItem> cartItems = cartService.userCartView(cart);
//
//        int totalPrice = 0;
//        for(CartItem cartItem : cartItems){
//            totalPrice += (cartItem.getItem().getItemPrice()*cartItem.getCount());
//        }
//
//        model.addAttribute("cartItemList",cartItems);
//        model.addAttribute("totalPrice",totalPrice);
//        model.addAttribute("user",userId);
//
//        return "/user/cart";
//    }
//
//    /*특정상품 장바구니에 추가*/
//    @PostMapping("/user/{userId}/cart/{itemId}")
//    public String addMyCart(@PathVariable("userId") String userId,@PathVariable("itemId") Long itemId,int count){
//        User user = userService.getUser(userId);
//        Item item = itemService.getItem(itemId);
//
//        cartService.addCart(user,item,count);
//
//        return "/store/detailmenu";
//    }
//
//
//}