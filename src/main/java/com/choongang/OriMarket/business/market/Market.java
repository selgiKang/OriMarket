package com.choongang.OriMarket.business.market;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.favorite.Fav;
import com.choongang.OriMarket.manager.user.ManagerUser;
import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.store.Store;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.Manager;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="market")
@Data
@NoArgsConstructor
@Log4j2
public class Market {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "market_seq",nullable = false)
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
