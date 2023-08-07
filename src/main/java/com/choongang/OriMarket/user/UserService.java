package com.choongang.OriMarket.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.*;

@Service
@RequiredArgsConstructor
@Log4j2
public class UserService {

    private final UserRepository userRepository;
    private final UserAddressRepository userAddressRepository;

    public boolean login(User member, HttpSession session) {
        session.removeAttribute("userAddress1");
        session.removeAttribute("userAddressDetail1");
        //값이 null일 떄 Optinal이 처리
        User findUser = userRepository.findByUserId(member.getUserId());

        if (findUser == null) {
            return false;
        }

        if (!findUser.getUserPassword().equals(member.getUserPassword())) {
            return false;
        }
        List<UserAddress> userAddresses = findUser.getUserAddresses();
        if (userAddresses.isEmpty()) {
        } else {
            session.setAttribute("userAddress1", userAddresses.get(userAddresses.size() - 1).getUserAddress1());
            session.setAttribute("userAddressDetail1", userAddresses.get(userAddresses.size() - 1).getUserAddressDetail1());
        }


        session.setAttribute("userSeq", findUser.getUserSeq());
        session.setAttribute("userName", findUser.getUserName());
        session.setAttribute("userId", findUser.getUserId());
        session.setAttribute("userPassword", findUser.getUserPassword());
        session.setAttribute("userNickname", findUser.getUserNickname());
        session.setAttribute("userPhone", findUser.getUserPhone());
        session.setAttribute("userEmail", findUser.getUserEmail());
        session.setAttribute("userAddress", findUser.getUserAddress());
        session.setAttribute("userAddressDetail", findUser.getUserAddressDetail());

        return true;
    }

    public boolean join(User user, HttpSession session) {

        User savedUser = userRepository.save(user);

        if (savedUser == null) {

            return false;
        } else {

            session.setAttribute("userSeq", savedUser.getUserSeq());
            session.setAttribute("userName", savedUser.getUserName());
            session.setAttribute("userId", savedUser.getUserId());
            session.setAttribute("userPassword", savedUser.getUserPassword());
            session.setAttribute("userNickname", savedUser.getUserNickname());
            session.setAttribute("userPhone", savedUser.getUserPhone());
            session.setAttribute("userEmail", savedUser.getUserEmail());
            session.setAttribute("userAddress", savedUser.getUserAddress());
            session.setAttribute("userAddressDetail", savedUser.getUserAddressDetail());


            return true;
        }
    }

    public boolean delete(Long UserSeq) {
        User user = userRepository.findById(UserSeq).orElse(null);
        if (user != null) {
            List<UserAddress> userAddresses = user.getUserAddresses();
            try {
                for (UserAddress userAddress : userAddresses) {
                    userAddressRepository.delete(userAddress);
                }
                userRepository.delete(user);
                return true;
            } catch (Exception e) {

                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean checkUserId(String userId) {
        return userRepository.existsByUserId(userId);

    }

    public User getUser(String userId) {
        return userRepository.findByUserId(userId);
    }

}