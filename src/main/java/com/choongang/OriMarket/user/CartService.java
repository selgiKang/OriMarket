package com.choongang.OriMarket.user;

import com.choongang.OriMarket.order.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@Service
@RequiredArgsConstructor
@Slf4j
public class CartService {

    @Autowired
    private final UserRepository userRepository;
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final OrderService orderService;
    //private final ItemRepository itemRepository;
/*
    public Long addCart(CartItem cartItem, String userId){
       아이템레포지토리에서 해당아이템id, 유저레포지토리에서 해당 유저id검색
        * 카트레포지토리에서 회원id로 검색해서 만약 카트가 null이라면
        * createcart
        *
        * 카트아이템레포지토리에서 저장된 카트아이템검색(카트id,아이템id)
        * 저장된 카트아이템이 null이 아니라면 addCount, null이라면 createCartItem

    }

 */
/*


    public Long addCart(CartItem cItem, String userId) {
        Item item = itemRepository.findById(cartItem.getCartItemId()).orElseThrow(EntityNotFoundException::new);
        User user = userRepository.findByUserId(userId);


        Cart cart = cartRepository.findByUserId(user.getUserId());
        if(cart ==null){
            cart = Cart.createCart(user);
            cartRepository.save(cart);
        }
        CartItem savedCartItem = cartItemRepository.findByCartIdAndCartItemId(cart.getCartId(),item.getId());


        */
/*장바구니에 기존 상품이 존재할 경우*//*

        if(savedCartItem != null){
            savedCartItem.addCount(cartItem.getCount());
            return savedCartItem.getId();
        }else {
            CartItem cartItem = CartItem.createCartItem(cart,item,cItem.getCount());
            cartItemRepository.save(cartItem);
            return cartItem.getCartItemId();
        }

    }

*/





}
