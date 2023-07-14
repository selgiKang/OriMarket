package com.choongang.OriMarket.store;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.print.attribute.standard.MediaSize;

@Entity
@Table(name = "goods")
@Getter
@Setter
public class Item {

    @Id
    @Column(name = "item_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long itemId;

    @Column
    private String itemName;

    @Column
    private int itemCnt;

    @Column
    private int itemPrice;

    @Column
    private int itemG;

    @Column
    private String itemFrom;

    @Column
    private String itemInfo;

/*
    @ManyToOne
    @JoinColumn(name = "storeId")
    private Strore itemStoreNum;
*/
}
