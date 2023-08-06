package com.choongang.OriMarket.business.market;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.manager.user.ManagerUser;
import lombok.*;
import lombok.extern.log4j.Log4j2;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="market")
@Getter
@Setter
// 기본 생성자 생성, 초기값 세팅이 필요한 final 변수가 있을 경우 컴파일 에러가 발생하니 주의
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Log4j2
public class Market {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "market_seq")
    private Long marketSeq;

    @Column
    private String marketName;

    @Column
    private double marketLatitude;

    @Column
    private double marketLongitude;

    //시장 주소
    @Column
    private String marketHref;

    @OneToMany(mappedBy = "market")
    private List<BusinessUser> businessUsers = new ArrayList<>();

    @OneToMany(mappedBy = "market")
    private List<BusinessStore> businessStore = new ArrayList<>();

    @OneToMany(mappedBy = "market")
    private List<ManagerUser> managerUser = new ArrayList<>();

}
