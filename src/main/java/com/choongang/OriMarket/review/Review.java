package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.user.User;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
    @Column(name = "review_id")
    private Long review_id;

    @Column
    private Integer rating;

    @Column
    private String content;

    @Column
    private String pictureUrl;

    //생성일
    @CreatedDate
    private LocalDateTime createdDate;

    //수정일
    @LastModifiedDate
    private LocalDateTime modifiedDate;

    @Column
    private String taste;

    @Column
    private String amount;

    @Column
    private String status;

    @Column
    private String itemName;

    @Column
    private String buStoreName;

    @Column
    private String orderNumber;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="business_store")
    private BusinessStore businessStore;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="user_seq")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="item_id")
    private Item item;

    @OneToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "new_order_seq")
    private NewOrder newOrder;

    @Column(length = 500)
    private String  businessReplyMessage;
}
