package com.choongang.OriMarket.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItem,Long> {


    List<OrderItem> findByUser_UserSeq(Long userSeq);

    OrderItem findByItem_ItemId(Long itemId);

    OrderItem findByUser_UserSeqAndItem_ItemId(Long userSeq,Long itemId);

    List<OrderItem> findByCart_CartId(Long cartId);

}
