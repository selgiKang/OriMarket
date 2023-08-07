package com.choongang.OriMarket.business.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface BusinessUserRepository extends JpaRepository<BusinessUser, Long> {


    boolean existsByBuUserId(String buUserId);
    BusinessUser findByBuUserId(String buUserId);
    List<BusinessUser> findByBuUserNameContaining(String keyword);
    List<BusinessUser> findByBuUserNumber(Long keyword);




}
