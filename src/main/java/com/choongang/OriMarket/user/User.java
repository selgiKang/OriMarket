package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.store.Item;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Member")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "seq", nullable = false)
    private Long userSeq;

    @Column(unique = true)
    private String userId;

    @Column
    private String userPassword;

    @Column
    private String userName;

    @Column
    private String userNickname;

    @Column
    private String userPhone;

    @Column
    private String userEmail;

    @Column
    private String userAddress;

    @Column
    private String userAddressDetail;

    @OneToMany(mappedBy = "user")
    private List<UserAddress> userAddresses = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    private List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    private List<Item> items = new ArrayList<>();

    //fav원투매니를 해야할까?? menuname, menuprice, menudetail 만들어놓고

}
