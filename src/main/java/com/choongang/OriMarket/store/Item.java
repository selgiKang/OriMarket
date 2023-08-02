package com.choongang.OriMarket.store;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.user.CartItem;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "goods")
@Getter
@Setter
public class Item {

    @Id
    @Column(name = "item_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long itemId;

    @Column
    private String itemName;

    @Column
    private Integer itemCnt;

    //원가
    @Column
    private Integer itemCost;

    //판매 가격
    @Column
    private Integer itemPrice;

    @Column
    private Integer itemG;

    //물건 원산지
    @Column
    private String itemFrom;

    //물건 등록일
    @Column
    private String itemRegDate;

    @Column
    private String itemInfo;

    @Column
    private String itemCategory;

    @Column
    private String itemImageUrl;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="bu_store_number")
    private BusinessStore businessStore;

    @OneToMany(mappedBy = "item")
    private List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "item", cascade =  CascadeType.REMOVE)
    private List<CartItem> cartItems = new ArrayList<>();



}


