package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BusinessUserRepository extends JpaRepository<BusinessUser, Long> {


    boolean existsByBuUserId(String buUserId);

    BusinessUser findByBuUserId(String buUserId);

}
