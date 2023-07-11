package com.choongang.OriMarket.user;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart,Long> {


    /*현재 로그인한 회원의 cart엔티티를 찾기 위한 쿼리메소드
         Cart findByUserId(Long UserId);

     */
}
