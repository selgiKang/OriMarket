package com.choongang.OriMarket.order;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "order")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    @Id
    @Column(name = "order_number", nullable = false)
    private String order_number;

    @Column(name="order_menu_name")
    private String order_menu_name;

    @Column(name="order_user_id")
    private String order_user_id;

    @Column(name="oder_address_number")
    private Integer order_address_number;

    @Column(name="order_totalPrice")
    private Integer order_totalPrice;

    @Column(name="order_date")
    private Date order_date;

    @Column(name="order_type")
    private String order_type;

    @Column(name="order_requests")
    private String order_requests;


}
