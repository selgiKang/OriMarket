package com.choongang.OriMarket.store;

import com.choongang.OriMarket.business.store.BusinessStore;
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
    private Integer itemCnt;

    @Column
    private Integer itemPrice;

    @Column
    private Integer itemG;

    @Column
    private String itemFrom;

    @Column
    private String itemInfo;

    /*
    @ManyToOne
    @JoinColumn(name = "store_number")
    private Store store;
*/
}

