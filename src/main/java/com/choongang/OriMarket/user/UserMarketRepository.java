package com.choongang.OriMarket.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface UserMarketRepository extends JpaRepository<UserMarket, Long> {

    List<UserMarket> findByUser(User user);
}

