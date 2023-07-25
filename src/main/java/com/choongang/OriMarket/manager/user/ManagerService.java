package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketService;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.order.Order;
import com.choongang.OriMarket.order.OrderRepository;
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
    private  final OrderRepository orderRepository;


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

    //해당 매니저 불러오기
    public ManagerUser findByManagerId(Model model,HttpSession session){
       String managerId = session.getAttribute("managerId").toString();
        System.out.println("managerId"+managerId);
        //매니저 번호 넣어서 매니저가 소속된 시장 번호 꺼내기
        ManagerUser userResult = managerRepository.findByManagerId(managerId);

        //시장 번호
        if(userResult!=null){
            if(userResult.getMarket().getMarketSeq()!=null){
                Long marketSeq = userResult.getMarket().getMarketSeq();
                Market market = new Market();
                market.setMarketSeq(marketSeq);
                System.out.println("매니저 소속 시장번호: "+marketSeq);
                //시장 번호 가지고 그 시장의 주문 가져오기
                List<Order> managerOrderList = orderRepository.findByMarketSeq(market);
                model.addAttribute("managerOrderList",managerOrderList);
            }
        }


        return userResult;
    }
}
