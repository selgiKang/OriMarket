//package com.choongang.OriMarket.user;
//
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//import javax.persistence.*;
//import java.util.Date;
//
//@Entity
//@Table(name = "Cart")
//@Getter
//@Setter
//@AllArgsConstructor
//@NoArgsConstructor
//public class Cart {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
//    @Column(name = "cart_number")
//    private int cartId; /*장바구니pk*/
//
//    private int cartMenuNum; /*상품pk*/
//
//    private int cartCnt;
//
//    private String cartCheck;
//
//    private int cartDeliveryPrice;
//
//    private int cartTotalPrice;
//
//    /*비회원은 세션대신 쿠키를 사용해야한다. 쿠키 제한시간*/
//    private Date cartCkLimit;
//
//    /*쿠키 value값*/
//    private String cartCkId;
//
//
//    @OneToOne
//    @JoinColumn(name = "userId")
//    private User userId;
//
//    /*회원 엔티티를 파라미터로 받아서 장바구니 엔티티를 생성하는 로직
//       1명당 1개의 장바구니 필요,처음 장바구니에 상품을 담을때는 장바구니를 생성해야함
//     */
//
//    public static Cart createCart(User userId) {
//        Cart cart = new Cart();
//        if (userId != null) {
//            cart.setUserId(userId);
//        }
//
//        return cart;
//    }
//
//}
