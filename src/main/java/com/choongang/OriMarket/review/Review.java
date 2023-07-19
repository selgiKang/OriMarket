package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserAddress;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "userReview")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EntityListeners(AuditingEntityListener.class)
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "review_id", nullable = false)
    private Long review_id;

    @Column
    private int rating;

    @Column
    private String content;

    @Column
    private String picture_url;

    //생성일
    @CreatedDate
    private LocalDateTime created_date;

    //수정일
    @LastModifiedDate
    private LocalDateTime modified_date;

    @Column
    private String taste;

    @Column
    private String delivery;

    @Column
    private String status;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="bu_store_number")
    private BusinessStore businessStore;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="user_seq")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="item_id")
    private Item item;






}
