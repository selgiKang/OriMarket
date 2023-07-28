package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.store.Store;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BusinessStoreRepository extends JpaRepository<BusinessStore,Long> {

    BusinessStore findByBusinessUser(BusinessUser businessUser);

    List<BusinessStore> findByBuStoreName(String searchKeyword);

    BusinessStore findByBuStoreNumber(Long businessStoreNumber);


}
