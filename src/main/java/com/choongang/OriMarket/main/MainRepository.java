package com.choongang.OriMarket.main;

import com.choongang.OriMarket.user.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface MainRepository extends JpaRepository<User, Long> {

    User findByUserId(String userId);

}
