//package com.choongang.OriMarket.user;
//
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//import javax.persistence.*;
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
//    private int cartNum;
//
//    private int cartMenuNum;
//
//    private String cartMenu;
//
//    private int cartCnt;
//
//    private String cartCheck;
//
//    private int cartDeliveryPrice;
//
//    private int cartTotalPrice;
//
//    @OneToOne
//    @JoinColumn(name = "userId")
//    private User user;
//
//    /*회원 엔티티를 파라미터로 받아서 장바구니 엔티티를 생성하는 로직
//     *   1명당 1개의 장바구니 필요,처음 장바구니에 상품을 담을때는 장바구니를 생성해야함
//     * */
//
//    public static Cart createCart(User user){
//        Cart cart  = new Cart();
//        cart.setUser(user);
//        return cart;
//    }
//
//
//}
