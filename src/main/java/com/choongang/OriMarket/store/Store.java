package com.choongang.OriMarket.store;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "stores")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Store {


    @Id
    @Column(name = "store_number")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String storeName;

    @Column
    private String storePnumber;

    @Column
    private String storeCategory;

    @Column
    private String storeAddress;

}
