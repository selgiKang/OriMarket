package com.choongang.OriMarket.user;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "Member")
@Getter
@Setter
//생성자
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "seq", nullable = false)
    private Long userSeq;

    @Column(unique = true)
    private String userId;

    @Column
    private String userPassword;

    @Column
    private String userName;

    @Column
    private String userNickname;

    @Column
    private String userPhone;

    @Column
    private String userEmail;

    @Column
    private String userAddress;

    @Column
    private String userAddressDetail;
}
