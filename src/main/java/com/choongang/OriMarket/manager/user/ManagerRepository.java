package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.user.BusinessUser;
import org.springframework.beans.PropertyValues;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ManagerRepository extends JpaRepository<ManagerUser,Long> {
    ManagerUser findByManagerId(String managerId);
    ManagerUser findByManagerName(String managerName);

    boolean existsByManagerId(String managerId);

}
