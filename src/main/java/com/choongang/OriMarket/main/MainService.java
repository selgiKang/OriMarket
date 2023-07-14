package com.choongang.OriMarket.main;

import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor 
@Slf4j
public class MainService {

    @Autowired
    private final MainRepository userRepository;

    public void updateAddress(HttpSession session,User user){

        if(session.getAttribute("userId")==null){
                session.setAttribute("userAddress", user.getUserAddress());
                session.setAttribute("userAddressDetail", user.getUserAddressDetail());
        }else {
            User save = userRepository.save(user);
            session.setAttribute("userAddress", save.getUserAddress());
            session.setAttribute("userAddressDetail", save.getUserAddressDetail());

        }

    }

};