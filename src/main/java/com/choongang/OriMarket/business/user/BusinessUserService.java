package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.review.ReviewRepository;
import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor 
@Slf4j
public class BusinessUserService {

    @Autowired
    private final BusinessUserRepository businessUserRepository;
    private final BusinessStoreRepository businessStoreRepository;
    private final ReviewRepository reviewRepository;

    public boolean login1(BusinessUser businessUser, HttpSession session, Model model) {
        BusinessUser findbusinessUser = businessUserRepository.findByBuUserId(businessUser.getBuUserId());
            session.setAttribute("buUserNumber",findbusinessUser.getBuUserNumber());
        List<Review> all = reviewRepository.findAll();


        if (findbusinessUser.getBusinessStores().isEmpty()) {

            } else {
                List<BusinessStore> businessStores = findbusinessUser.getBusinessStores();
                if (businessStores.isEmpty()) {
                } else {
                    model.addAttribute("re",all);
                    model.addAttribute("save", businessStores.get(0));
                }
            }



        if(findbusinessUser == null){
            return false;
        }

        if(!businessUser.getBuUserPassWord().equals(findbusinessUser.getBuUserPassWord())){
            return false;
        }
        session.setAttribute("buUserNumber",findbusinessUser.getBuUserNumber());
        System.out.println("buUserNumber: "+session.getAttribute("buUserNumber"));
        return true;
    }


    public boolean join1(BusinessUser businessUser, HttpSession session) {
        System.out.println("모라고 나올까요?"+businessUser.getBuUserNumber());


        if(businessUserRepository.findById(businessUser.getBuUserNumber()).isEmpty()){

        }else {
            BusinessUser byId = businessUserRepository.findById(businessUser.getBuUserNumber()).orElseThrow();
            if(businessUser.getBuUserNumber().equals(byId.getBuUserNumber())){
                return false;
            }else {

            }
        }
        BusinessUser savedbusinessUser = businessUserRepository.save(businessUser);

        if (savedbusinessUser == null) {

            return false;
        } else {

            return true;
        }
    }

    public boolean checkBuId(String buUserId){
        return businessUserRepository.existsByBuUserId(buUserId);

    }
};