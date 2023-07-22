package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.*;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table (name = "orders")
@Getter
@Setter
@NoArgsConstructor
@Slf4j
public class Order {

    @Id
    @Column(name = "order_number", nullable = false)
    private String orderNumber;

    //사업자 번호 받기
    @ManyToOne
    @JoinColumn(name = "bu_user_number")
    private BusinessUser businessUser;

    //가게이름
    @Column
    private String orderMarketName;

    @Column
    private String orderUserId;

    @Column
    private String orderAddressNumber;

    //물건 총 가격 + 배송비
    @Column
    private Integer orderTotalPrice;

    //주문 날짜
    @Column
    private String orderDate;

    //신용카드 결제 종류
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

    //시장 번호
    @ManyToOne
    @JoinColumn(name="market_seq")
    private Market marketSeq;

    @Transient
    private String next_redirect_pc_url;

    //출력 날짜
    @Transient
    private String calculate_date;

    //끝나는 날짜
    @Transient
    private String calculate_date_last;
}
