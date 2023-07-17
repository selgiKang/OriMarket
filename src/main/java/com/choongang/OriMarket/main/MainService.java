package com.choongang.OriMarket.main;

import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserAddress;
import com.choongang.OriMarket.user.UserAddressRepository;
import com.choongang.OriMarket.user.UserRepository;
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
public class MainService {

    @Autowired
    private final MainRepository userRepository;

    @Autowired
    private final UserAddressRepository userAddressRepository;

    public void updateAddress(HttpSession session, UserAddress userAddress, Model model){

        if(session.getAttribute("userId")==null){
                session.setAttribute("userAddress1", userAddress.getUserAddress1());
                session.setAttribute("userAddressDetail1", userAddress.getUserAddressDetail1());
        }else {
            Object userId = session.getAttribute("userSeq");
            User user = userRepository.findById((Long) userId).orElseThrow();
            userAddress.setUser(user);
            userAddressRepository.save(userAddress);

            List<UserAddress> userAddresses = user.getUserAddresses();
            model.addAttribute("userAddress2",userAddresses);

            session.setAttribute("userAddress1", userAddress.getUserAddress1());
            session.setAttribute("userAddressDetail1", userAddress.getUserAddressDetail1());

        }

    }

};