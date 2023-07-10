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
    @Column(name = "user_seq", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
}
