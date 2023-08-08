package com.choongang.OriMarket.rider;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface RiderRepository extends JpaRepository<Rider, Long> {

    boolean existsByRiderId(String riderId);

    Rider findByDriverLicense(String driverLicense);

    Rider findByRiderId(String riderId);


}
