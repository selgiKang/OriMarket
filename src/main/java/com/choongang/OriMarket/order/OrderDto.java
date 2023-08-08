package com.choongang.OriMarket.order;

import lombok.*;

import javax.persistence.*;
import java.util.Date;



@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class OrderDto {

    private String orderNumber;


    private String orderMarketName;


    private String orderUserId;


    private Integer orderTotalPrice;


    private String orderDate;


    private String orderType;

    //가게 이름

    private String orderStoreName;

    //물건 이름

    private String orderGoodsName;

    //물건 가격

    private  String orderGoodsPrice;

    //물건 개수

    private  String orderGoodsNum;

    //물건 총 가격

    private String orderGoodsTotalPrice;

    //배송비

    private  String orderDeliveryPrice;

    //요청사항

    private String orderRequests;

    //배달기사 요청사항

    private String forRider;

    private String next_redirect_pc_url;

    @Builder
    public OrderDto(String orderNumber, String orderMarketName, String orderUserId, Integer orderAddressNumber, Integer orderTotalPrice, String orderDate, String orderType, String orderStoreName, String orderGoodsName, String orderGoodsPrice, String orderGoodsNum, String orderGoodsTotalPrice, String orderDeliveryPrice, String orderRequests, String forRider, String next_redirect_pc_url) {
        this.orderNumber = orderNumber;
        this.orderMarketName = orderMarketName;
        this.orderUserId = orderUserId;
        this.orderTotalPrice = orderTotalPrice;
        this.orderDate = orderDate;
        this.orderType = orderType;
        this.orderStoreName = orderStoreName;
        this.orderGoodsName = orderGoodsName;
        this.orderGoodsPrice = orderGoodsPrice;
        this.orderGoodsNum = orderGoodsNum;
        this.orderGoodsTotalPrice = orderGoodsTotalPrice;
        this.orderDeliveryPrice = orderDeliveryPrice;
        this.orderRequests = orderRequests;
        this.forRider = forRider;
        this.next_redirect_pc_url = next_redirect_pc_url;
    }
}
