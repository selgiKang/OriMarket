package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.store.Item;
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
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "cart_item_id",unique = true)
    private Long cartItemId;

    /*하나의 장바구니에는 여러개의 상품을 담을 수 있으니까 다대일*/
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cart_id")
    private Cart cart;

    /*장바구니에 담을 상품의 정보를 알아야 하니까 상품엔티티 매핑*/
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private Item item;

    /*같은 상품을 장바구니에 몇개 담을지..*/
    private int count;

    private int itemPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seq")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="bu_store_number")
    private BusinessStore businessStore;

    /*장바구니에 담을 상품엔티티를 생성하는 메소드*/

    public static CartItem createCartItem(Cart cart,Item item, int count,int itemPrice,User user){
        CartItem cartItem = new CartItem();
        cartItem.setCart(cart);
        cartItem.setItem(item);
        cartItem.setCount(count);
        cartItem.setItemPrice(itemPrice);
        cartItem.setUser(user);
        cartItem.setBusinessStore(item.getBusinessStore());
        return cartItem;

        //Item을 가져와서 저장하는데,,왜 businessStoreNumber는 cartItem에 저장이 안되지???

    }

    /*장바구니에 담을 수량을 증가시켜주는 메소드 추가*/
    public void addCount(int count){
        this.count += count;;

    }
}
