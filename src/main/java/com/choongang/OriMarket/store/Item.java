package com.choongang.OriMarket.store;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.print.attribute.standard.MediaSize;

@Entity
@Table(name = "Goods")
@Getter
@Setter
public class Item {

    @Id
    @Column(name = "menu_num")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long ItemId;

    @Column
    private String ItemName;

    @Column
    private int ItemCnt;

    @Column
    private int ItemPrice;

    @Column
    private int ItemG;

    @Column
    private String ItemFrom;

    @Column
    private String ItemInfo;

/*
    @ManyToOne
    @JoinColumn(name = "storeId")
    private Strore ItemStoreNum;
*/
}
