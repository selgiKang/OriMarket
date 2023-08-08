package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.store.Item;
import lombok.*;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;



@Entity
@Table(name = "businessStore")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)

public class BusinessStore {

    @Id
    @Column(name="bu_store_number")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long buStoreNumber;

    @Column
    private String buStoreName;

    @Column
    private String buStorePhone;

    @Column
    private String buStoreCategory;

    @Column
    private String buStoreAddress;

    @Column
    private String buStoreAddressDetail;

    @Column
    private String buStoreImageUrl;

    @Column
    private String status;

    //사업자 번호
    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="business_user")
    private BusinessUser businessUser;

    @OneToMany(mappedBy = "businessStore")
    private List<Item> items = new ArrayList<>();

    @OneToMany(mappedBy = "businessStore")
    private List<Review> reviews = new ArrayList<>();

    //시장 고유 번호
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "marketSeq")
    private Market market;


    @Override
    public String toString() {
        return buStoreName; // 가게 이름 반환
    }
}
