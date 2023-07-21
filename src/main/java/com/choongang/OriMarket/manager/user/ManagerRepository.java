package com.choongang.OriMarket.manager.user;

import org.springframework.beans.PropertyValues;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ManagerRepository extends JpaRepository<ManagerUser,Long> {
    ManagerUser findByManagerId(String managerId);

    boolean existsByManagerId(String managerId);
}
