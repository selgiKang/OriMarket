package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.user.User;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "new_orders_detail")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
//생성자를 다른곳에서 못쓰게 접근제한해서 무분별한 기본 생성자 만드는 것 제한
@Slf4j
public class NewOrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "new_order_detail_seq")
    private Long newOrderDetailSeq;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="new_order_seq")
    private NewOrder newOrder;

    @Column
    private String orderNumber;

    @Column
    private String itemName;

    @Column
    private String buStoreNumber;

    @Column
    private String buStoreName;

    @Column
    private String itemPrice;

    @Column
    private String itemCount;

    @Column
    private String itemImageUrl;

//    @Column
//    private String reviewtrue;

}
