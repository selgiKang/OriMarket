package com.choongang.OriMarket.order;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "orders")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    @Id
    @Column(name = "order_number", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long orderNumber;

    @Column
    private String orderMenuName;

    @Column
    private String orderUserId;

    @Column
    private Integer orderAddressNumber;

    @Column
    private Integer orderTotalPrice;

    @Column
    private Date orderDate;

    @Column
    private String orderType;

    @Column
    private String orderRequests;


}
