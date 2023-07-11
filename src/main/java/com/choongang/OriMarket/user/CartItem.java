package com.choongang.OriMarket.user;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

/*장바구니에 담을 상품id와 수량을 전달받을 cartItem클래스*/

@Entity
@Table(name = "cart_item")
@Getter
@Setter
public class CartItem {

    @Id
    @GeneratedValue
    @Column(name = "cartItemId")
    private Long itemId;

    @ManyToOne
    @JoinColumn(name = "cartId")
    private Cart cart;

    // @ManyToOne
    // @JoinColumn(name = "itemId")
    //private Item item;

    private int count;

    /*장바구니에 담을 상품엔티티를 생성하는 메소드
    public static CartItem createCartItem(Cart cart,Item item, int count){
        CartItem cartItem = new CartItem();
        cartItem.setCart(cart);
        cartItem.setItem(item);
        cartItem.setCount(count);
        return cartItem;

    }
*/


    /*장바구니에 담을 수량을 증가시켜주는 메소드 추가*/
    public void addCount(int count){
        this.count += count;
    }

}
