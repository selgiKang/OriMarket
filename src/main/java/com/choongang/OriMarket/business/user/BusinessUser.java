package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.order.Order;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "businessUser")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class BusinessUser {

    @Id
    @Column(name = "bu_user_number", nullable = false)
    private Long buUserNumber;

    @Column(unique = true)
    private String buUserId;

    @Column
    private String buUserPassWord;

    @Column
    private String buUserName;

    @Column
    private String buUserAddress;

    @Column
    private String buUserAddressDetail;

    @Column
    private String buUserPhone;

    @OneToMany(mappedBy = "businessUser")
    private List<BusinessStore> businessStores = new ArrayList<>();

    //임시 오더
    @OneToMany(mappedBy = "businessUser")
    private List<Order> orders = new ArrayList<>();
}
