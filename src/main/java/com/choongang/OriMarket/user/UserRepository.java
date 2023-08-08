package com.choongang.OriMarket.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface UserRepository extends JpaRepository<User, Long> {

    User findByUserId(String userId);

    User findByUserSeq(Long userSeq);

    boolean existsByUserId(String userId);


    List<User> findByUserIdContaining(String userId);

    List<User> findByUserNameContaining(String userName);

    List<User> findByUserEmailContaining(String userEmail);

    List<User> findByUserNicknameContaining(String userNickname);


}

