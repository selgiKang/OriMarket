package com.choongang.OriMarket.rider;

import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.user.CartItem;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RiderRepository extends JpaRepository<Rider,Long> {

    boolean existsByRiderId(String riderId);

    Rider findByDriverLicense(String driverLicense);

    Rider findByRiderId(String riderId);


}
