package com.choongang.OriMarket.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoginService {

    @Autowired
    private final UserRepository userRepository;

    public boolean login(User user) {

        User findUser = userRepository.findByUserId(user.getUserId());

        if(findUser == null){
            return false;
        }

        if(!findUser.getPw().equals(user.getPw())){
            return false;
        }

        return true;

    }

};