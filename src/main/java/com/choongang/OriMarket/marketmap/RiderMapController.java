package com.choongang.OriMarket.marketmap;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketRepository;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.order.OrderRepository;
import com.choongang.OriMarket.order.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequiredArgsConstructor
@Slf4j
public class RiderMapController {

    @Autowired
    private final OrderService orderService;

    @GetMapping("/riderdelivery")
    public String riderdelivery() {
        return "rider/rider_firstscreen";
    }

    @GetMapping("/showMarkerOnMap")
    public String showMarkerOnMap(@RequestParam String orderNumber, Model model) {
        String addressNumber = orderService.getOrderAddressNumber(orderNumber);
        if (addressNumber != null) {
            // 주소 정보(addressNumber)를 이용하여 지도 위에 마커를 표시하는 코드를 작성합니다.
            // (지도 API를 사용하여 마커를 표시하는 방법은 해당 API의 사용법에 따라 다를 수 있습니다.)
            // ... (지도 API를 이용한 마커 표시 코드 작성)
            model.addAttribute("addressNumber", addressNumber);
        }
        return "rider/rider_firstscreen"; // 마커를 표시할 뷰 페이지로 이동
    }



};

