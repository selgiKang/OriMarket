package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketService;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.review.ReviewRepository;
import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor 
@Slf4j
public class BusinessUserService {

    @Autowired
    private final BusinessUserRepository businessUserRepository;
    private final ReviewRepository reviewRepository;
    private final MarketService marketService;

    public boolean login1(BusinessUser businessUser, HttpSession session, Model model) {
        BusinessUser findbusinessUser = businessUserRepository.findByBuUserId(businessUser.getBuUserId());

        List<Review> all = reviewRepository.findAll();

        if(findbusinessUser == null){
            return false;
        }

        if(findbusinessUser.getBusinessStores().isEmpty()) {
        }else{
                List<BusinessStore> businessStores = findbusinessUser.getBusinessStores();
                if (businessStores.isEmpty()) {
                } else {
                    model.addAttribute("re",all);
                    model.addAttribute("save", businessStores.get(0));
                }
            }

        if(!businessUser.getBuUserPassWord().equals(findbusinessUser.getBuUserPassWord())){
            return false;
        }
        if(findbusinessUser.getMarket().getMarketSeq()!=null){
            session.setAttribute("marketSeq",findbusinessUser.getMarket().getMarketSeq());
        }
        session.setAttribute("buUserNumber",findbusinessUser.getBuUserNumber());
        System.out.println("buUserNumber: "+session.getAttribute("buUserNumber"));
        return true;
    }


    public boolean join1(BusinessUser businessUser, HttpSession session) {
        Market market = marketService.findMarket(businessUser.getMarket().getMarketName());
        businessUser.setMarket(market);
        if(businessUserRepository.findById(businessUser.getBuUserNumber()).isEmpty()){

        }else{
            BusinessUser byId = businessUserRepository.findById(businessUser.getBuUserNumber()).orElseThrow();
            if(byId.getBuUserNumber().equals(businessUser.getBuUserNumber())){return false;}
        }
        BusinessUser save = businessUserRepository.save(businessUser);
        if(save == null){
            return false;
        }
        return true;
    }

    public boolean checkBuId(String buUserId){
        return businessUserRepository.existsByBuUserId(buUserId);
    }

    //회원 정보 조회
    public BusinessUser buUserNumber(HttpSession session){
        String buUserId = session.getAttribute("buUserId").toString();
        System.out.println("아이디:"+buUserId);
        return businessUserRepository.findByBuUserId(buUserId);
    }
    //회원 정보 수정
    public boolean buUserUpdate(BusinessUser businessUser,HttpSession session){
        BusinessUser buUserResult = businessUserRepository.save(businessUser);
        if(buUserResult == null){
            return false;
        }else{
            return true;
        }
    }
    //회원 탈퇴
    public boolean buUserDelete(HttpSession session){
        String buUserId=session.getAttribute("buUserId").toString();
        BusinessUser buUserResult = businessUserRepository.findByBuUserId(buUserId);

        if(buUserResult!=null){
            try{
                businessUserRepository.delete(buUserResult);
                return true;
            }catch (Exception e){
                e.printStackTrace();
            }
        }
            return false;
    }
};