package com.choongang.OriMarket.store;

import com.choongang.OriMarket.business.store.BusinessStore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemRepository extends JpaRepository<Item,Long> {
  //  Item findByItemName(String itemName);

    Item findByItemId(Long itemId);



}
