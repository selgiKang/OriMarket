package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreService;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@Slf4j
public class CartController {

    private final CartService cartService;
    private final UserService userService;
    private final ItemService itemService;

    public CartController(CartService cartService, UserService userService,ItemService itemService){
        this.cartService=cartService;
        this.userService=userService;
        this.itemService=itemService;
    }

    /*내 장바구니 조회*/
    @GetMapping("/{userId}/cart")
    public String myCartPage(@PathVariable("userId") String userId, Model model){
        Cart cart = cartService.getCart(userId);
        User user = userService.getUser(userId);

        List<CartItem> cartItems = cartService.userCartView(cart);
        List<CartItem> userOrderList = cartService.userOrderList(user);

        int totalPrice = 0;
        for(CartItem cartItem : cartItems){
            totalPrice += (cartItem.getItem().getItemPrice()*cartItem.getCount());

        }

        model.addAttribute("cartItemList",cartItems);
        model.addAttribute("totalPrice",totalPrice);
        model.addAttribute("user",userId);
        model.addAttribute("userOrderList",userOrderList);

        return "/user/cart";
    }

    /*특정상품 장바구니에 추가*/
    @PostMapping("/{userId}/cart")
    public String addMyCart(@PathVariable("userId") String userId, Long itemId, int count, int itemPrice){
        User user = userService.getUser(userId);
        Item additem = itemService.getItem(itemId);

        cartService.addCart(user,additem,count,itemPrice);

        return "/store/detailmenu";
    }



    /*장바구니페이지에서 수량증감*/
    @PutMapping("/user/cart")
    @ResponseBody
    public String menuPlusMinus(@RequestParam("cartItemId")Long cartItemId,@RequestParam("type") String type){
        String result = cartService.menuPlusMinus(cartItemId,type);
        return result;
    }


    /*장바구니 페이지에서 아이템개별삭제*/
    @DeleteMapping("/user/cart")
    @ResponseBody
    public String itemDelete(@RequestParam("cartItemId")Long cartItemId){
        cartService.itemDelete(cartItemId);
        return "ok";
    }

//
//
//    /*결제***그리고 장바구니 삭제*/
//    @GetMapping("/{userId}/cart/checkout")
//    public String myCartPayment(@PathVariable("userId") String userId,Model model) {
//
//
//        cartService.cartPayment(userId);
//        cartService.cartDeleteAll(userId);
//
//
//        return "/order/receipt";
//    }


    @GetMapping("/paymentPage/{userId}")
    public String orderPayment(@PathVariable("userId")String userId,Model model){

       cartService.saveCartInfo(userId);

        Cart cart = cartService.getCart(userId);
        List<CartItem> cartItems = cartService.userCartView(cart);


        model.addAttribute("cartItemList",cartItems);
        model.addAttribute("totalPrice",cart.getCartTotalPrice());
        model.addAttribute("deliveryPrice",cart.getCartDeliveryPrice());


        return "/order/order_paymentPage";
    }




}