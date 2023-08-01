package com.choongang.OriMarket.store;

import com.choongang.OriMarket.business.store.BusinessStore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemRepository extends JpaRepository<Item,Long> {
  //  Item findByItemName(String itemName);

    Item findByItemId(Long itemId);

    List<Item> findByItemNameContaining(String searchKeyword);

    List<Item> findByCartItems(Long cartItemId);

    Item findByItemName(String itemName);






}
