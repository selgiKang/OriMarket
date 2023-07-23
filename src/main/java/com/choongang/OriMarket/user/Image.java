package com.choongang.OriMarket.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "image")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "image_seq", unique = true)
    private Long imageSeq;


    private String imageUrl; // 이미지 경로를 저장할 필드

    // 게터와 세터, 생성자 등 필요한 메서드들을 구현합니다.

    // 이미지 경로를 설정하는 메서드
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    // 이미지 경로를 가져오는 메서드
    public String getImageUrl() {
        return imageUrl;
    }

}
