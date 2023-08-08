package com.choongang.OriMarket.search;

import lombok.*;
import org.locationtech.jts.geom.Point;
import javax.persistence.*;


@Entity
@Table(name = "market_search")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MarketSearch {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String MarketSearchAddress;

    @Column(columnDefinition = "GEOMETRY")
    private Point geography;

}
