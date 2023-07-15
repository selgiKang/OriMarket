package com.choongang.OriMarket.business.store;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "businessStore")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class BusinessStore {

    @Id
    @Column(name="bu_store_number",nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long buStoreNumber;

    @Column
    private String buStoreName;

    @Column
    private String buStorePhone;

    @Column
    private String buStoreCategory;

    @Column
    private String buStoreAddress;

    @Column
    private String buStoreAddressDetail;

}
