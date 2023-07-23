package com.choongang.OriMarket.user;

import org.springframework.data.jpa.repository.JpaRepository;


public interface UserMarketRepository extends JpaRepository<UserMarket, Long> {

    UserMarket findByUserMarketName(String marketName);
}

