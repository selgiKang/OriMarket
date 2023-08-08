package com.choongang.OriMarket.manager.user;

import org.springframework.data.jpa.repository.JpaRepository;


public interface ManagerRepository extends JpaRepository<ManagerUser,Long> {
    ManagerUser findByManagerId(String managerId);
    ManagerUser findByManagerName(String managerName);
    boolean existsByManagerId(String managerId);

}
