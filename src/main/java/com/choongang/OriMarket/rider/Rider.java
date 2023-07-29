package com.choongang.OriMarket.rider;

import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.user.UserAddress;
import com.choongang.OriMarket.user.UserMarket;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Rider")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Rider {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "rider_seq", nullable = false)
    private Long riderSeq;

    private String riderId;

    private String riderPassword;

    private String riderName;

    private String riderPhone;

    private String riderAddress;

    private String driverLicense;





}
