package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.user.User;
import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "fav")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Fav {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long favId;

    @ManyToOne
    @JoinColumn(name = "userSeq")
    private User userSeq;

    @Column
    private String favStoreName;

    @Transient
    private String favNumber;

    @Column
    private String favStoreImg;

}
