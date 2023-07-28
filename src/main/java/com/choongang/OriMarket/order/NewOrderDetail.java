package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.user.User;
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
@Slf4j
public class NewOrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "new_order_detail_seq")
    private Long newOrderDetailSeq;

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




}
