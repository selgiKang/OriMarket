package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    List<Review> findByBusinessStore(BusinessStore businessStore);

    List<Review> findByBusinessStore_BuStoreNumber(Long buStoreNumber);

}
