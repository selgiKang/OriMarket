package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table (name = "orders")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Order {

    @Id
    @Column(name = "order_number", nullable = false)
    private String orderNumber;

    //사업자 번호 받기
    @ManyToOne
    @JoinColumn(name = "bu_user_number")
    private BusinessUser businessUser;


    @Column
    private String orderMarketName;

    @Column
    private String orderUserId;

    @Column
    private Integer orderAddressNumber;

    @Column
    private Integer orderTotalPrice;

    @Column
    private String orderDate;

    @Column
    private String orderType;

    //가게 이름
    @Column
    private String orderStoreName;

    //물건 이름
    @Column
    private String orderGoodsName;

    //물건 가격
    @Column
    private  String orderGoodsPrice;

    //물건 개수
    @Column
    private  String orderGoodsNum;

    //물건 총 가격
    @Column
    private String orderGoodsTotalPrice;

    //배송비
    @Column
    private  String orderDeliveryPrice;

    //요청사항
    @Column
    private String orderRequests;

    //배달기사 요청사항
    @Column
    private String forRider;

    @Transient
    private String next_redirect_pc_url;
}
