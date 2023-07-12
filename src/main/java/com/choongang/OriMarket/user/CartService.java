/*
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
    private final ItemRepository itemRepository;

*/
/*
       ItemRepository에서 해당Itemid, UserRepository에서 해당 Userid검색
        * CartRepository에서 Userid로 검색해서 만약 카트가 null이라면 >>> createcart

        CartItemRepository에서 저장된 카트아이템검색(CartId,Itemid)
        * 저장된 카트아이템이 null이 아니라면 addCount, null이라면 createCartItem
 *//*




    public Long addCart(CartItem cItem, String userId) {
        Item item = itemRepository.findById(cItem.getCartItemId()).orElseThrow(EntityNotFoundException::new);
        User user = userRepository.findByUserId(userId);


        Cart cart = cartRepository.findByUserId(user.getUserId());
        if(cart ==null){
            cart = Cart.createCart(user);

            */
/*save() 트랜잭션커밋시점에 파라미터 엔티티의 값과 1차 캐시에 저장되어 있는 엔티티의 값을 비교하여
            * 다른 점이 있을 경우 UPDATE쿼리가 발생, DB에 해당 값이 없을 경우 INSERT쿼리발생. *//*

            cartRepository.save(cart);
        }
        CartItem savedCartItem = cartItemRepository.findByCartIdAndCartItemId(cart.getCartId(),item.getItemId());



*/
/*장바구니에 기존 상품이 존재할 경우*//*


        if(savedCartItem != null){
            savedCartItem.addCount(cItem.getCount());
            return savedCartItem.getCartItemId();
        }else {
            CartItem cartItem = CartItem.createCartItem(cart,item,cItem.getCount());
            cartItemRepository.save(cartItem);
            return cartItem.getCartItemId();
        }

    }







}
*/
