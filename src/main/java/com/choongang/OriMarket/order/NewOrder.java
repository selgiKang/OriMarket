package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.manager.user.ManagerUser;
import com.choongang.OriMarket.rider.Rider;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserMarket;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "new_orders")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Slf4j
@EntityListeners(AuditingEntityListener.class)
public class NewOrder {

    @Id
    @Column(name = "new_order_seq")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long newOrderSeq;

    @Column
    private String orderNumber;

    @Column
    private String itemId1;

    @Column
    private  String orderGoodsNum;

    @Column
    private String orderStatus;

    //배송비
    @Column
    private  String orderDeliveryPrice;

    //배달 타입
    @Column
    private String deliveryType;

    //배달기사 요청사항
    @Column
    private String forRider;

    //물건 총 가격
    @Column
    private String orderGoodsTotalPrice;

    //물건 총 가격 + 배송비
    @Column
    private Integer orderTotalPrice;

    @Column
    private String orderMarketName;

    //신용카드 결제 종류
    @Column
    private String orderType;

    //요청사항
    @Column
    private String orderRequests;

    @OneToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "seq")
    private User user;

    //매니저 번호
    @OneToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name="managerSeq")
    private ManagerUser managerUser;

    @OneToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name="rider_seq")
    private Rider rider;

    //생성일
    @CreatedDate
    private LocalDateTime created_date;

    //수정일
    @LastModifiedDate
    private LocalDateTime modified_date;

    @OneToMany(mappedBy = "newOrder")
    private List<NewOrderDetail> newOrderDetails = new ArrayList<>();

    @Column
    private String orderAddress;

}
