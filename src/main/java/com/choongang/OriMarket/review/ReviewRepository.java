package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.Store;
import com.choongang.OriMarket.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review,Long> {

    List<Review> findByBusinessStore(BusinessStore businessStore);

}
