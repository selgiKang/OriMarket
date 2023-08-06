package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketService;
import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.order.NewOrderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class ManagerService {

    private final ManagerRepository managerRepository;
    private final MarketService marketService;
    private final NewOrderRepository newOrderRepository;


    public boolean join(ManagerUser managerUser) {
        Market market = marketService.findMarket(managerUser.getMarket().getMarketName());
        managerUser.setMarket(market);
        if (managerRepository.findByManagerId(managerUser.getManagerId()) == null) {

        } else {
            ManagerUser mu = managerRepository.findByManagerId(managerUser.getManagerId());
            if (mu.getManagerId().equals(managerUser.getManagerId())) {
                return false;
            }
        }
        ManagerUser saveUser = managerRepository.save(managerUser);
        if (saveUser == null) {
            return false;
        }
        return true;
    }

    public boolean checkManagerId(String managerId) {
        return managerRepository.existsByManagerId(managerId);
    }

    public boolean loginCheck(ManagerUser managerUser, HttpSession session) {
        ManagerUser findManagerUser = managerRepository.findByManagerId(managerUser.getManagerId());

        if (findManagerUser == null) {
            return false;
        }
        if (!managerUser.getManagerPassword().equals(findManagerUser.getManagerPassword())) {
            return false;
        }
        if (findManagerUser.getMarket().getMarketSeq() != null) {
            session.setAttribute("marketSeq", findManagerUser.getMarket().getMarketSeq());
        }
        session.setAttribute("managerName", findManagerUser.getManagerName());
        session.setAttribute("managerSeq", findManagerUser.getManagerSeq());
        return true;
    }

    //해당 매니저 불러오기
    public ManagerUser findByManagerId(Model model, HttpSession session) {
        String managerId = session.getAttribute("managerId").toString();

        //매니저 번호 넣어서 매니저 정보 꺼내기(시장 번호도 확인)
        ManagerUser userResult = managerRepository.findByManagerId(managerId);

        //시장 번호
        if (userResult != null) {
            if (userResult.getMarket().getMarketSeq() != null) {
                String marketName = userResult.getMarket().getMarketName();

                //시장 번호 가지고 그 시장의 주문 가져오기
                List<NewOrder> orderResult = newOrderRepository.findByOrderMarketName(marketName);
                model.addAttribute("managerOrderList", orderResult);
            }
        }
        return userResult;
    }

    //매니저 아이디 찾기
    public ManagerUser getManager(String managerName) {
        return managerRepository.findByManagerName(managerName);
    }

    public boolean managerUpdate(ManagerUser managerUser, HttpSession session) {
        ManagerUser managerUpdateResult = managerRepository.save(managerUser);
        if (managerUpdateResult == null) {
            return false;
        } else {
            return true;
        }
    }

    //회원 탈퇴
    public boolean managerUserDelete(HttpSession session) {
        String managerId = session.getAttribute("managerId").toString();
        ManagerUser managerUserResult = managerRepository.findByManagerId(managerId);

        if (managerUserResult != null) {
            try {
                managerRepository.delete(managerUserResult);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public List<ManagerUser> getAllManagerUsers() {
        return managerRepository.findAll();

    }
}
