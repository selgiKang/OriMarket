package com.choongang.OriMarket.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "Member")
@Getter
@Setter
//생성자
@AllArgsConstructor
@NoArgsConstructor
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
