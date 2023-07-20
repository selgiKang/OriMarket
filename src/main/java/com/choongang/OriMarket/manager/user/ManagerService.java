package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketService;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.review.Review;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.yaml.snakeyaml.error.Mark;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ManagerService {

    @Autowired
    private  final ManagerRepository managerRepository;
    private  final MarketService marketService;

    public boolean join(ManagerUser managerUser, HttpSession session){
        Market market = marketService.findMarket(managerUser.getMarket().getMarketName());
        managerUser.setMarket(market);
        if(managerRepository.findByManagerId(managerUser.getManagerId())==null){

        }else {
            ManagerUser mu = managerRepository.findByManagerId(managerUser.getManagerId());
            if (mu.getManagerId().equals(managerUser.getManagerId())) {
                return false;
            }
        }
        ManagerUser saveUser = managerRepository.save(managerUser);
        if(saveUser==null){
            return false;
        }
        return true;
    }

    public boolean checkManagerId(String managerId){
        return managerRepository.existsByManagerId(managerId);
    }

    public boolean loginCheck(ManagerUser managerUser, HttpSession session) {
        ManagerUser findManagerUser = managerRepository.findByManagerId(managerUser.getManagerId());

        //session.setAttribute("managerId",findManagerUser.getManagerId());

        if(findManagerUser == null){
            return false;
        }

        if(!managerUser.getManagerPassword().equals(findManagerUser.getManagerPassword())){
            return false;
        }
        if(findManagerUser.getMarket().getMarketSeq()!=null){
            session.setAttribute("marketSeq",findManagerUser.getMarket().getMarketSeq());
        }
        session.setAttribute("managerName",findManagerUser.getManagerName());
        return true;
    }
}
