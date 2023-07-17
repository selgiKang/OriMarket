package com.choongang.OriMarket.user;

import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

        List<CartItem> cartItems = cartService.userCartView(cart);

        int totalPrice = 0;
        for(CartItem cartItem : cartItems){
            totalPrice += (cartItem.getItem().getItemPrice()*cartItem.getCount());
        }

        model.addAttribute("cartItemList",cartItems);
        model.addAttribute("totalPrice",totalPrice);
        model.addAttribute("user",userId);

        return "/user/cart";
    }

    /*특정상품 장바구니에 추가*/
    @PostMapping("/{userId}/cart")
    public String addMyCart(@PathVariable("userId") String userId,Item item,int count,int itemPrice){
        User user = userService.getUser(userId);
        Item additem = itemService.getItem(item.getItemName());

        cartService.addCart(user,additem,count,itemPrice);

        return "/store/detailmenu";
    }


    /*수량추가*/

    @GetMapping("/{userId}/cart/{itemName}/plus")
    public String addCount(@PathVariable("userId")String userId,@PathVariable("itemName")String itemName){

        System.out.println("컨트롤러시작");
        Cart cart = cartService.getCart(userId);
        Item addItem = itemService.getItem(itemName);

        System.out.println("item.getItemPrice: "+addItem.getItemPrice());

        cartService.plusCount(cart,addItem,addItem.getItemPrice());

        return "/userId/cart";
    }



    /*수량감소*/
    @GetMapping("/{userId}/cart/{itemName}/minus/{itemCount}")
    public String minusCount(@PathVariable("userId")String userId, @PathVariable("itemName")String itemName,@PathVariable("itemCount")int count, Item item){
        User user = userService.getUser(userId);
        Item addItem = itemService.getItem(itemName);

        Cart cart = cartService.getCart(userId);

        cart.setCartTotalPrice(cart.getCartTotalPrice()-item.getItemPrice());

        return "/user/cart";
    }



    /*특정상품 장바구니에서 삭제*/
    @GetMapping("/{userId}/cart/{cartItemId}/delete/{itemPrice}")
    public String myCartDelete(@PathVariable("userId") String userId, @PathVariable("cartItemId") Long cartItemId,@PathVariable("itemPrice") int itemPrice){
        Cart cart  = cartService.getCart(userId);
        cart.setCartCnt(cart.getCartCnt()-1);
        /*토탈가격에서 삭제아이템 가격빼줘야함*/
        cart.setCartTotalPrice(cart.getCartTotalPrice()-itemPrice);
        cartService.cartItemDelete(cartItemId);

        return "/user/cart";

    }




    /*결제후 장바구니 삭제*/
    @PostMapping("/{userId}/cart/checkout")
    public String myCartPayment(@PathVariable("userId") String userId,Model model) {

        cartService.cartPayment(userId);
        cartService.cartDeleteAll(userId);

        return "/main";
    }





}