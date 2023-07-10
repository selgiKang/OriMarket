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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String orderNumber;

    @Column(name="order_menu_name")
    private String orderMenuName;

    @Column(name="order_user_id")
    private String orderUserId;

    @Column(name="oder_address_number")
    private Integer orderAddressNumber;

    @Column(name="order_totalPrice")
    private Integer orderTotalPrice;

    @Column(name="order_date")
    private Date orderDate;

    @Column(name="order_type")
    private String orderType;

    @Column(name="order_requests")
    private String orderRequests;


}
