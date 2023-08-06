package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.store.BusinessStore;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "businessUser")
@Getter
@Setter
//생성자
//접근 제한을 하여 기본 생성자의 무분별한 생성를 막아서 의도하지 않은 엔티티를 만드는 것을 막을 수 있기 때문
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class BusinessUser {

    @Id
    @Column(name = "bu_user_number")
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

    @Column
    private String buUserEmail;

    //등록 가게
    @OneToMany(mappedBy = "businessUser")
    private List<BusinessStore> businessStores = new ArrayList<>();

    //시장 번호
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "marketSeq")
    private Market market;
}
