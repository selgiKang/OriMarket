package com.choongang.OriMarket.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "Member")
@Getter
@Setter
//생성자
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    @Id
    @Column(name = "seq", nullable = false)
    private Long user_seq;

    @Column(unique = true)
    private String user_id;

    @Column
    private String user_password;

    @Column
    private String user_name;

    @Column
    private String user_nickname;

    @Column
    private String user_phone;

    @Column
    private String user_email;

    @Column
    private String user_address;
}
