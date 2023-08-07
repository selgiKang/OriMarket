package com.choongang.OriMarket.search;

import lombok.*;
import org.locationtech.jts.geom.Point;

import javax.persistence.*;


@Entity
@Table(name = "market_search")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MarketSearch {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String MarketSearchAddress;

    @Column(nullable = false, columnDefinition = "GEOMETRY")
    private Point geography;

}
