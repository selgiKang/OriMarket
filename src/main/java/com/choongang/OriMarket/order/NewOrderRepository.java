package com.choongang.OriMarket.order;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.manager.user.ManagerUser;
import com.choongang.OriMarket.rider.Rider;
import com.choongang.OriMarket.user.User;
import org.geolatte.geom.M;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;


public interface NewOrderRepository extends JpaRepository<NewOrder, Long> {

    List<NewOrder> findByOrderMarketName(String marketName);

    NewOrder findByOrderNumber(String orderNumber);

    List<NewOrder> findByUser(User user);

    @Query("SELECT n FROM NewOrder n WHERE n.createdDate > ?1 AND n.createdDate < ?2")
    List<NewOrder> findNewOrdersBetweenDates(String calculate_date, String calculate_date_last);

    //containing = 특정 문자열을 포함하는 데이터를 검색 가능
    List<NewOrder> findByCreatedDateContaining(String orderDate);
    List<NewOrder> findByRider(Rider rider);
    List<NewOrder> findByRiderOrderByCreatedDateDesc(Rider rider);
    List<NewOrder> findByOrderStatusAndUserOrderByCreatedDateDesc(String string,User user);
    Page<NewOrder> findByManagerUserOrderByCreatedDateDesc(ManagerUser managerUser, Pageable pageable);
    Page<NewOrder> findByRiderOrderByCreatedDateDesc(Rider rider,Pageable pageable);
    Page<NewOrder> findByManagerUser(ManagerUser managerUser, Pageable pageable);
}
