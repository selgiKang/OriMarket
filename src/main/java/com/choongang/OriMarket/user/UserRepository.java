package com.choongang.OriMarket.user;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Member, Long> {

    Member findByUserId(String userId);


}
