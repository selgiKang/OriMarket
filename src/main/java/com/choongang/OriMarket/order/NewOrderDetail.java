package com.choongang.OriMarket.order;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.persistence.*;

@Entity
@Table(name = "new_orders_detail")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
//생성자를 다른곳에서 못쓰게 접근제한해서 무분별한 기본 생성자 만드는 것 제한
@Log4j2
public class NewOrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "new_order_detail_seq")
    private Long newOrderDetailSeq;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name = "new_order_seq")
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

    @Column
    private String reviewtrue;

}
