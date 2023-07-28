package com.choongang.OriMarket.order;

import com.choongang.OriMarket.RealTimeStatus.RealTimeStatus;
import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.manager.user.ManagerUser;
import com.choongang.OriMarket.rider.Rider;
import com.choongang.OriMarket.user.User;
import lombok.*;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    //시장이름
    @Column
    private String orderMarketName;

    @Column
    private String orderUserId;


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

    //배달 타입
    @Column
    private String deliveryType;

    //시장 번호
    @ManyToOne
    @JoinColumn(name="market_seq")
    private Market marketSeq;

    //사업자 번호 받기
    @ManyToOne
    @JoinColumn(name = "bu_user_number")
    private BusinessUser businessUser;

    //매니저 번호
    @ManyToOne
    @JoinColumn(name="managerSeq")
    private ManagerUser managerUser;

    // RealTimeStatus와의 연관관계 설정
    @OneToOne(mappedBy = "orderNumber")
    private RealTimeStatus realTimeStatus;

    @ManyToOne
    @JoinColumn(name="rider_seq")
    private Rider rider;
//    @Transient
//    private String next_redirect_pc_url;
    //출력 날짜
    @Transient
    private String calculate_date;

    //끝나는 날짜
    @Transient
    private String calculate_date_last;




}
