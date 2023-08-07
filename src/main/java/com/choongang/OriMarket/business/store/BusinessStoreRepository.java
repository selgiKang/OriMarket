package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.store.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BusinessStoreRepository extends JpaRepository<BusinessStore,Long> {

    BusinessStore findByBusinessUser(BusinessUser businessUser);

    List<BusinessStore> findByBuStoreName(String searchKeyword);

    BusinessStore findByBuStoreNameAndMarket(String buStoreName, Market market);

    BusinessStore findByBuStoreNumber(Long businessStoreNumber);

    BusinessStore findByBusinessUser_BuUserNumber(Long buUserNumber);




}
