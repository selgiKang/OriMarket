package com.choongang.OriMarket.user;


import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.store.Item;

import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.store.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class CartService {


    private final UserRepository userRepository;
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final ItemRepository itemRepository;
    private final BusinessStoreRepository businessStoreRepository;
    private final ItemService itemService;


    @Autowired
    public CartService(UserRepository userRepository, CartRepository cartRepository,
                       CartItemRepository cartItemRepository, ItemRepository itemRepository,
                       BusinessStoreRepository businessStoreRepository, ItemService itemService) {
        this.userRepository = userRepository;
        this.cartRepository = cartRepository;
        this.cartItemRepository = cartItemRepository;
        this.itemRepository= itemRepository;
        this.businessStoreRepository=businessStoreRepository;
        this.itemService = itemService;
    }


/*
      ItemRepository에서 해당Itemid, UserRepository에서 해당 Userid검색
        * CartRepository에서 Userid로 검색해서 만약 카트가 null이라면 >>> createcart

       CartItemRepository에서 저장된 카트아이템검색(CartId,Itemid)
        * 저장된 카트아이템이 null이 아니라면 addCount, null이라면 createCartItem
 */


    //해당 id의 장바구니 가져오기
    public Cart getCart(String userId) {
        Cart cart = cartRepository.findByUserUserId(userId);
        return cart;
    }


    //장바구니 생성
    public void createCart(User user) {
        Cart cart = Cart.createCart(user);
        cartRepository.save(cart);
    }

    //장바구니에 item추가
    @Transactional
    public void addCart(User user, Item item, int count) {

        Cart cart = cartRepository.findByUserUserId(user.getUserId());
        Item saveitem = itemRepository.findByItemId(item.getItemId());
        //물건 가격
        int saveItemPrice = saveitem.getItemPrice();



        /*cart가 없다면 새로 생성*/
        if (cart == null) {
            cart = Cart.createCart(user);
            cartRepository.save(cart);
        }


        /*cartItem생성*/
        CartItem cartItem = cartItemRepository.findByCart_CartIdAndItem_ItemId(cart.getCartId(), item.getItemId());

        /*cartItem이 없다면 새로 생성*/
        if (cartItem == null) {
            cartItem = CartItem.createCartItem(cart, item, count, saveItemPrice, user);
            cartItemRepository.save(cartItem);

            cart.setCartCnt(cart.getCartCnt() + 1);
            cart.setCartTotalPrice(cart.getCartTotalPrice() + item.getItemPrice());
        } else {
            cartItem.addCount(count);
            cart.setCartTotalPrice(cart.getCartTotalPrice() + item.getItemPrice());
        }

    }
//
//    //가게정보조회(goods테이블에 가게id가 들어가지않으면 의미없다)
//    public List<Item> cartItemInfo(Long cartItemId){
//        List<Item> itemList = cartItemRepository.findByCartItemId(cartItemId);
//        List<Item> userItemInfo = new ArrayList<>();
//
//        for(Item items: itemList){
//            userItemInfo.add(items);
//        }
//         return userItemInfo;
//    }

    //유저의 주문리스트 조회하기
    public List<CartItem> userOrderList(User user){
        List<CartItem> userCartList = cartItemRepository.findByUser_UserSeq(user.getUserSeq());
        return  userCartList;
    }




    //장바구니 조회하기

    @Transactional
    public List<CartItem> userCartView(Cart cart) {
        List<CartItem> cartItems = cartItemRepository.findAll();
        List<CartItem> userItems = new ArrayList<>();



        for (CartItem cItem : cartItems) {
            if (cItem.getCart().getCartId() == cart.getCartId()) {
                userItems.add(cItem);
            }
        }
        return userItems;
    }

    //장바구니에서 Item개별삭제
    public void itemDelete(Long cartItemId) {
        cartItemRepository.deleteById(cartItemId);
    }


    public String menuPlusMinus(Long cartItemId, String type) {
        Optional<CartItem> cartItem = cartItemRepository.findById(cartItemId);
        if (type.equals("plus")) {
            cartItem.get().setCount(cartItem.get().getCount() + 1);
            cartItemRepository.save(cartItem.get());
        } else {
            cartItem.get().setCount(cartItem.get().getCount() - 1);
            cartItemRepository.save(cartItem.get());
        }
        return "ok";
    }


    //장바구니 결제
    @Transactional
    public void cartPayment(String userId) {
        List<CartItem> cartItems = cartItemRepository.findAll();
        List<CartItem> userCartItems = new ArrayList<>();
        Cart cart = cartRepository.findByUserUserId(userId);


        /*접속한 유저의 cartItem만 찾아서 저장*/
        for (CartItem cartItem : cartItems) {
            if (cartItem.getCart().getCartId().equals(cart.getCartId())) {
                userCartItems.add(cartItem);
            }
        }
        /*재고 변경하기*/
        for (CartItem cartItem : userCartItems) {
            /*현재 재고를 변수에 저장*/
            int stock = cartItem.getItem().getItemCnt();
            /*저장된 변수에서 결제한 갯수를 빼준다..*/
            stock = stock - cartItem.getCount();
            /*현 재고 변경*/
            cartItem.getItem().setItemCnt(stock);
            //재고가 0이면 삭제됨
            if(stock==0){
                itemService.deleteItems(cartItem.getItem().getItemId());
            }
        }

    }


    //주문결제후 장바구니 비우기
    public void cartDeleteAll(String userId, HttpSession session) {
        List<CartItem> cartItems = cartItemRepository.findAll();
        Cart cart = cartRepository.findByUserUserId(userId);
        int totalPrice = 0;
        int deliveryPrice = 0;

        //시장 번호 찾기
        BusinessStore bu = cartItems.get(0).getBusinessStore();
        BusinessStore buNumberResult = businessStoreRepository.findByBuStoreNumber(bu.getBuStoreNumber());
        Long marketSeq = buNumberResult.getMarket().getMarketSeq();

        session.setAttribute("marketSeq",marketSeq);

        /*접속유저의 cartItem만 찾아서 삭제*/
        for (CartItem cartItem : cartItems) {
            //주문하기 버튼을 누르면 cart테이블에 totalPrice,deliveryPrice저장.
            if (cartItem.getCart().getCartId().equals(cart.getCartId())) {
                totalPrice += cartItem.getItemPrice() * cartItem.getCount();
                cart.setCartTotalPrice(totalPrice);
                if (totalPrice < 30000) {
                    deliveryPrice += 3000;
                    cart.setCartDeliveryPrice(deliveryPrice);

                    //cartItem테이블 내역 삭제
                    cartItem.getCart().setCartCnt(cartItem.getCart().getCartCnt() - 1);
                    cartItemRepository.deleteById(cartItem.getCartItemId());
                } else {
                    cartItem.getCart().setCartCnt(cartItem.getCart().getCartCnt() - 1);
                    cartItemRepository.deleteById(cartItem.getCartItemId());
                }
            }
        }

    }



    public void saveCartInfo(String userId,String cart1) {
        List<CartItem> cartItems = cartItemRepository.findAll();
        Cart cart = cartRepository.findByUserUserId(userId);
        int totalPrice = 0;
        int deliveryPrice = 0;
        cart.setDeliveryType(cart1);

        for (CartItem cartItemList : cartItems) {
            if (cartItemList.getCart().getCartId().equals(cart.getCartId())) {
                totalPrice += cartItemList.getItemPrice() * cartItemList.getCount();

                cart.setCartTotalPrice(totalPrice);
                if (cart.getDeliveryType().equals("배달")) {
                    if (totalPrice < 30000 && deliveryPrice == 0) {
                        cart.setCartDeliveryPrice(3000);
                    } else if (deliveryPrice == 0) {
                        cart.setCartDeliveryPrice(0);
                    }
                }else {
                    cart.setCartDeliveryPrice(0);
                }
            }
        }
    }
}