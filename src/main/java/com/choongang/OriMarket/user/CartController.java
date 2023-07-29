package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.store.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Controller
@Slf4j
public class CartController {

    @Autowired
    private final CartService cartService;
    private final UserService userService;
    private final ItemService itemService;
    private final CartItemRepository cartItemRepository;
    private final OrderItemRepository orderItemRepository;


    private final ItemRepository itemRepository;

    public CartController(CartService cartService, UserService userService, ItemService itemService, CartItemRepository cartItemRepository, OrderItemRepository orderItemRepository, ItemRepository itemRepository){
        this.cartService=cartService;
        this.userService=userService;
        this.itemService=itemService;
        this.cartItemRepository = cartItemRepository;
        this.orderItemRepository = orderItemRepository;
        this.itemRepository = itemRepository;
    }

    @GetMapping("/cart")
    public String c(){
        return "/error/login_error";
    }


    /*내 장바구니 조회*/
    @GetMapping("/{userId}/cart")
    public String myCartPage(@PathVariable("userId") String userId, Model model){

        if(userId.isEmpty()){
            return "/error/login_error";
        }else {
            Cart cart = cartService.getCart(userId);
            User user = userService.getUser(userId);

            List<CartItem> byUserUserSeq = cartItemRepository.findByUser_UserSeq(user.getUserSeq());
            List<CartItem> cartItems = cartService.userCartView(cart);


            int totalPrice = 0;
            for (CartItem cartItem : cartItems) {
                totalPrice += (cartItem.getItem().getItemPrice() * cartItem.getCount());
            }

           /*   반복물 출력 실험
           for(int i=0;i<cartItems.size();i++){
                if(cartItems.get(i).getItem().getBusinessStore().equals(cartItems.get(i).getBusinessStore())){
                    System.out.println("가게:"+cartItems.get(i).getBusinessStore().getBuStoreName());
                    for(CartItem cartItem:cartItems){
                        for(Item item:cartItems.get(i).getBusinessStore().getItems()){
                            if(cartItem.getItem().equals(item)){
                                System.out.println("물건이름: "+item.getItemName());
                            }
                        }
                    }
                }
            }
            */

            model.addAttribute("cartItemList", cartItems);
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("user", userId);
            model.addAttribute("userOrderList", byUserUserSeq);

            return "/cart/cart";
        }
    }

    /*특정상품 장바구니에 추가*/
    @PostMapping("/{userId}/cart")
    public String addMyCart(@PathVariable("userId") String userId, @RequestParam("itemId") String itemId, int count,Model model){

        if(userService.getUser(userId) == null){
            // 장바구니에 물건을 담을때 비회원이면 로그인해달라고 창뛰우고 마이페이지로 넘어가기
            return "/error/login_error";
        }else {
            Long itemIdResult = Long.valueOf(itemId);
            //유저 찾기
            User user = userService.getUser(userId);
            Cart cart = cartService.getCart(userId);
            //물건 아이디 찾기..?
            Item additem = itemService.getItem(itemIdResult);

            System.out.println("카운트"+count);
            model.addAttribute("item", additem);

            //재고보다 많이 담으면 안담기게.
            if (count > additem.getItemCnt()) {
                // 재고보다 많은 수량을 담을 때 에러 처리
                return "error/login_error"; // 재고가 부족한 경우 에러 페이지로 이동
            }
            cartService.addCart(user, additem, count);

            return "/store/detailmenu";
//            return "redirect:/detailmenu/"+itemIdResult;
        }
    }


    /*장바구니페이지에서 수량증감*/
    @PutMapping("/user/cart")
    @ResponseBody
    public String menuPlusMinus(@RequestParam("cartItemId")Long cartItemId,@RequestParam("type") String type,Item item){
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


    /*order_paymentPage에서 다시 넘어오면 orderItem 삭제(누적되지않게)*/
    @GetMapping("/cart/order_renew/{userId}")
    public String orderItemRenew(@PathVariable("userId")String userId){

        Cart cart = cartService.getCart(userId);
        List<OrderItem> orderItems = orderItemRepository.findByCart_CartId(cart.getCartId());

        if(orderItems!=null){
            for(OrderItem orderItem:orderItems){
                orderItemRepository.deleteById(orderItem.getOrderItemId());
            }
        }
        return "redirect:/"+userId+"/cart";
    }

    /*결제페이지로 넘기기*/
    @PostMapping("/paymentPage/{userId}")
    public String orderPayment(@PathVariable("userId") String userId,
                               Model model,
                               @RequestParam("deliveryType") String deliveryType,
                               @RequestParam(value = "cboxAll", required = false) Boolean cboxAll,
                               @RequestParam(value = "currentCnt") int[] itemCnts,
                               @RequestParam(value = "individual_itemPrice") int[] itemPrices,
                               @RequestParam(value = "individual_cartItemId") Long[] cartItemIds,
                               @RequestParam(value = "itemId")Long[] itemIds) {


        if (userId.isEmpty()) {
            return "/error/login_error";
        } else {
            User user = userService.getUser(userId);
            Cart cart = cartService.getCart(userId);
            List<OrderItem> orderItemList = new ArrayList<>();


            // 선택된 카트 아이템의 아이디와 수량을 이용하여 OrderItem 엔티티를 생성하고 저장
            for (int i = 0; i < cartItemIds.length; i++) {
                Long cartItemId = cartItemIds[i];
                int itemCnt = itemCnts[i];
                int itemPrice = itemPrices[i];
                Long itemId = itemIds[i];

                Item item = itemRepository.findByItemId(itemId);
                CartItem cartItem = cartItemRepository.findCartItemByCartItemId(cartItemId);


                OrderItem orderItem = null;
                OrderItem existingOrderItem = orderItemRepository.findByUser_UserSeqAndItem_ItemId(user.getUserSeq(), itemId);

                if (existingOrderItem==null) {
                    if(cartItem.getItem().getItemId()==itemId){
                        orderItem = OrderItem.createOrderItem(cartItem.getCart(), cartItem.getItem(), cartItem.getCount(), cartItem.getItemPrice(), cartItem.getUser(),cartItem);
                        orderItemRepository.save(orderItem);
                        cart.setCartCnt(cart.getCartCnt() + 1);
                        cart.setCartTotalPrice(cart.getCartTotalPrice() + item.getItemPrice());
                    }
                } else {
                    orderItem = existingOrderItem;
                    orderItem.addCount(itemCnt);
                    orderItemRepository.save(orderItem);
                    cart.setCartTotalPrice(cart.getCartTotalPrice() + item.getItemPrice() * itemCnt);
                }

                orderItemList.add(orderItem);
            }

            cartService.processSelectedItems(userId, deliveryType, orderItemList);

            List<OrderItem> orderItems = cartService.userOrderCartView(cart);

            model.addAttribute("cartItemList", orderItems);
            model.addAttribute("totalPrice", cart.getCartTotalPrice());
            model.addAttribute("deliveryPrice", cart.getCartDeliveryPrice());
            model.addAttribute("cart", cart);
        }
        return "/order/order_paymentPage"; // 카카오페이 결제 페이지로 이동
    }



}