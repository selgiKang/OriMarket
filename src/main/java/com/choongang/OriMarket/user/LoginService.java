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

    public boolean login(Member user) {

        Member findUser = userRepository.findByUserId(user.getUser_id());

        if(findUser == null){
            return false;
        }

        if(!findUser.getUser_password().equals(user.getUser_password())){
            return false;
        }

        return true;

    }

};