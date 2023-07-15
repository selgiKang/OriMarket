package com.choongang.OriMarket.business.user;

import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor 
@Slf4j
public class BusinessUserService {

    @Autowired
    private final BusinessUserRepository businessUserRepository;

    public boolean login1(BusinessUser businessUser,HttpSession session) {
        BusinessUser findbusinessUser = businessUserRepository.findByBuUserId(businessUser.getBuUserId());

        if(findbusinessUser == null){
            return false;
        }

        if(!findbusinessUser.getBuUserPassWord().equals(findbusinessUser.getBuUserPassWord())){
            return false;
        }
        session.setAttribute("buUserNumber",findbusinessUser.getBuUserNumber());
        return true;
    }


    public boolean join1(BusinessUser businessUser, HttpSession session) {

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