package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.market.Market;
import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.persistence.*;

@Entity
@Table(name = "user_market")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Log4j2
public class UserMarket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_market_seq")
    private Long userMarketSeq;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name = "market_seq")
    private Market market;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name = "user_seq")
    private User user;

}
