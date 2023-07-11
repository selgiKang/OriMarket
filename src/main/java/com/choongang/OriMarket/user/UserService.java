package com.choongang.OriMarket.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    @Autowired
    private final UserRepository userRepository;

    public boolean login(User member) {

        User findUser = userRepository.findByUserId(member.getUserId());

        if(findUser == null){
            return false;
        }

        if(!findUser.getUserPassword().equals(member.getUserPassword())){
            return false;
        }

        return true;

    }

   public boolean join(User user){

       User savedUser = userRepository.save(user);

       if(savedUser == null){
           return false;
       }else {
           return true;
       }

   }

};