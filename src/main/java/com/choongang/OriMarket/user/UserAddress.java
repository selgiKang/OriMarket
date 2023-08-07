package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "UserAddress")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class UserAddress {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_address_seq", nullable = false)
    private Long userAddressSeq;

    @Column
    private String userAddress1;

    @Column
    private String userAddressDetail1;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="user_seq")
    private User user;


    //fav원투매니를 해야할까?? menuname, menuprice, menudetail 만들어놓고

}
