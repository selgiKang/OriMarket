package com.choongang.OriMarket.store;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {
    Item findByItemId(Long itemId);

    List<Item> findByItemNameContaining(String searchKeyword);

    List<Item> findByItemNameAndBusinessStore_BuStoreName(String itemName, String buStoreName);


}
