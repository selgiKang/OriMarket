package com.choongang.OriMarket.rider;


import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class RiderService {

    @Autowired
    private final RiderRepository riderRepository;

    public boolean checkRiderId(String riderId){
        return riderRepository.existsByRiderId(riderId);
    }

    public boolean riderJoin(Rider rider, HttpSession session) {

        // 만약 가입하려는 운전면허증으로 가입된 라이더가있으면 false반환
        if(riderRepository.findByDriverLicense(rider.getDriverLicense()) != null){return false;}

        Rider saverider = riderRepository.save(rider);
        if(saverider == null){
            return false;
        }else {
            return true;
        }
    }

    public boolean riderLogin(Rider rider,HttpSession session){
        Rider byRiderId = riderRepository.findByRiderId(rider.getRiderId());

        if(byRiderId == null){return false;}

        if(!byRiderId.getRiderPassword().equals(rider.getRiderPassword())){
            return false;
        }else {
            return true;
        }
    }
}