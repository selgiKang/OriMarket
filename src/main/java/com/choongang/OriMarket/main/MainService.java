package com.choongang.OriMarket.main;

import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserAddress;
import com.choongang.OriMarket.user.UserAddressRepository;
import com.choongang.OriMarket.user.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class MainService {

    private final UserRepository userRepository;
    private final UserAddressRepository userAddressRepository;

    public void updateAddress(HttpSession session, UserAddress userAddress, Model model) {

        if (session.getAttribute("userId") == null) {
            session.setAttribute("userAddress1", userAddress.getUserAddress1());
            session.setAttribute("userAddressDetail1", userAddress.getUserAddressDetail1());
        } else {
            Object userId = session.getAttribute("userSeq");
            User user = userRepository.findById((Long) userId).orElseThrow();
            userAddress.setUser(user);
            userAddressRepository.save(userAddress);

            List<UserAddress> userAddresses = user.getUserAddresses();
            model.addAttribute("userAd", userAddresses);

            session.setAttribute("userAddress1", userAddress.getUserAddress1());
            session.setAttribute("userAddressDetail1", userAddress.getUserAddressDetail1());
        }
    }
}