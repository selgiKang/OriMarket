package com.choongang.OriMarket.business.user;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "businessUser")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class BusinessUser {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "bu_User_number", nullable = false)
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

}
