package com.choongang.OriMarket.business.message;

import com.choongang.OriMarket.business.user.BusinessUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message,Long> {

    List<Message> findByBuUserNumber(BusinessUser buUserNumber);
}
