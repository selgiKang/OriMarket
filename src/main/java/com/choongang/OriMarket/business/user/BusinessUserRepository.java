package com.choongang.OriMarket.business.user;

import org.springframework.data.jpa.repository.JpaRepository;


public interface BusinessUserRepository extends JpaRepository<BusinessUser, Long> {


    boolean existsByBuUserId(String buUserId);

    BusinessUser findByBuUserId(String buUserId);




}
