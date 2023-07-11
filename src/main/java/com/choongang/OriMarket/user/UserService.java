package com.choongang.OriMarket.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    @Autowired
    private final UserRepository userRepository;

    public boolean login(User user, Model model) {
        Optional<User> findUserOptional = userRepository.findByUserId(user.getUserId());

        if (findUserOptional.isPresent()) { // isPresent 값이 존재하는지 확인하는거 존재하면 true 존재하지않으면 false 반환
            User findUser = findUserOptional.get();
            if (findUser.getUserPassword().equals(user.getUserPassword())) {
                model.addAttribute("user",findUser);
                return true;
            }
        }
        return false;
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