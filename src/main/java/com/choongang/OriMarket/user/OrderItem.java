package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.store.Item;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "order_item")
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "order_item_id", unique = true)
    private Long orderItemId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cart_id")
    private Cart cart;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private Item item;

    private int count;

    private int itemPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seq")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bu_store_number")
    private BusinessStore businessStore;

    @OneToOne
    @JoinColumn(name = "cart_item_id")
    private CartItem cartItem;

    public static OrderItem createOrderItem(Cart cart, Item item, int count, int itemPrice, User user,CartItem cartItem) {
        OrderItem orderItem = new OrderItem();
        orderItem.setCart(cart);
        orderItem.setItem(item);
        orderItem.setCount(count);
        orderItem.setItemPrice(itemPrice);
        orderItem.setUser(user);
        orderItem.setCartItem(cartItem);
        orderItem.setBusinessStore(item.getBusinessStore());
        return orderItem;
    }

    public void addCount(int count){
        this.count += count;;

    }
}