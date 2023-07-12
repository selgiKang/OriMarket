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
//    private Long cartId; /*장바구니pk*/
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
//  //  private Date cartCkLimit;
//
//    /*쿠키 value값*/
//  //  private String cartCkId;
//
//
//    /*장바구니 엔티티 조회하면서 유저엔티티정보도 가져올 수 있게 1:1매핑
//        지연로딩으로 설정하면 실제엔티티 대신 프록시 객체를 넣어둔다.
//        프록시 객체는 실제로 사용하기 전까지는 데이터로딩을 하지않고,
//        실제 사용 시점에 조회 쿼리문 실행 */
//    @OneToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "userId")
//    private User user;
//
//    /*회원 엔티티를 파라미터로 받아서 장바구니 엔티티를 생성하는 로직
//       1명당 1개의 장바구니 필요,처음 장바구니에 상품을 담을때는 장바구니를 생성해야함
//     */
//
//    public static Cart createCart(User user) {
//        Cart cart = new Cart();
//        cart.setUser(user);
//        return cart;
//    }
//
//}
