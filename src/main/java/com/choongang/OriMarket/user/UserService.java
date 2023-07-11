package com.choongang.OriMarket.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    @Autowired
    private final UserRepository userRepository;

    public boolean login(User member,HttpSession session) {

        //값이 null일 떄 Optinal이 처리
        User findUser = userRepository.findByUserId(member.getUserId());

        if(findUser == null){
            return false;
        }

        if(!findUser.getUserPassword().equals(member.getUserPassword())){
            return false;
        }

        session.setAttribute("userName",findUser.getUserName());
        session.setAttribute("userID",findUser.getUserId());
        session.setAttribute("userPassword",findUser.getUserPassword());
        return true;

    }

   public boolean join(User user) {

       User savedUser = userRepository.save(user);

       if (savedUser == null) {
           return false;
       } else {
           return true;
       }
       //userRepository.findByUserId()
   }


};