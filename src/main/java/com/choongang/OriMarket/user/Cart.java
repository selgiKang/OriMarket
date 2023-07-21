package com.choongang.OriMarket.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;

import java.util.List;

@Entity
@Table(name = "cart")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "cart_id", unique = true)
    private Long cartId;

    private int cartMenuNum;

    private int cartCnt;

    private int cartDeliveryPrice;

    private int cartTotalPrice;

    private String deliveryType;

                         /* pk대신 원하는 컬럼 가져오기 referencedColumnName*/
    @OneToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "seq")
    private User user;

    //    cartItems 테이블이 생성됨.
   @OneToMany(fetch = FetchType.LAZY)
    private List<CartItem> cartItems = new ArrayList<>();


    /*회원 엔티티를 파라미터로 받아서 장바구니 엔티티를 생성하는 로직
     1명당 1개의 장바구니 필요,처음 장바구니에 상품을 담을때는 장바구니를 생성해야함
   */
    public static Cart createCart(User user) {
        Cart cart = new Cart();
        cart.setUser(user);
        return cart;
    }


}
