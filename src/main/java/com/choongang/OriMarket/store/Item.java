package com.choongang.OriMarket.store;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.user.BusinessUser;
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
    private Integer itemCost;

    @Column
    private Integer itemPrice;

    @Column
    private Integer itemG;

    @Column
    private String itemFrom;

    @Column
    private String itemRegDate;

    @Column
    private String itemInfo;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="bu_store_number")
    private BusinessStore businessStore;

    /*
    @ManyToOne
    @JoinColumn(name = "store_number")
    private Store store;
*/
}

