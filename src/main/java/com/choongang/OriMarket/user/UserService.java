package com.choongang.OriMarket.user;

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
public class UserService {

    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private final UserAddressRepository userAddressRepository;

    public boolean login(User member, HttpSession session,Model model) {
        session.removeAttribute("userAddress1");
        session.removeAttribute("userAddressDetail1");
        //값이 null일 떄 Optinal이 처리
        User findUser = userRepository.findByUserId(member.getUserId());

        if(findUser == null){
            return false;
        }

        if(!findUser.getUserPassword().equals(member.getUserPassword())){
            return false;
        }
        List<UserAddress> userAddresses = findUser.getUserAddresses();
        if (userAddresses.isEmpty()){
        }else {
            model.addAttribute("userAddress2",userAddresses);
            session.setAttribute("userAddress1",userAddresses.get(0).getUserAddress1());
            session.setAttribute("userAddressDetail1",userAddresses.get(0).getUserAddressDetail1());
        }


        session.setAttribute("userSeq",findUser.getUserSeq());
        session.setAttribute("userName",findUser.getUserName());
        session.setAttribute("userId",findUser.getUserId());
        session.setAttribute("userPassword",findUser.getUserPassword());
        session.setAttribute("userNickname",findUser.getUserNickname());
        session.setAttribute("userPhone",findUser.getUserPhone());
        session.setAttribute("userEmail",findUser.getUserEmail());
        session.setAttribute("userAddress",findUser.getUserAddress());
        session.setAttribute("userAddressDetail",findUser.getUserAddressDetail());

        return true;
    }

   public boolean join(User user, HttpSession session) {

       User savedUser = userRepository.save(user);

       if (savedUser == null) {

           return false;
       } else {

           session.setAttribute("userSeq",savedUser.getUserSeq());
           session.setAttribute("userName",savedUser.getUserName());
           session.setAttribute("userId",savedUser.getUserId());
           session.setAttribute("userPassword",savedUser.getUserPassword());
           session.setAttribute("userNickname",savedUser.getUserNickname());
           session.setAttribute("userPhone",savedUser.getUserPhone());
           session.setAttribute("userEmail",savedUser.getUserEmail());
           session.setAttribute("userAddress",savedUser.getUserAddress());
           session.setAttribute("userAddressDetail",savedUser.getUserAddressDetail());


           return true;
       }
       //userRepository.findByUserId()
   }

   public void delete(Long UserSeq){
        User user = userRepository.findById(UserSeq).orElseThrow();
        userRepository.delete(user);
   }

   public boolean checkUserId(String userId){
       return userRepository.existsByUserId(userId);

   }

    public User getUser(String userId){
        return userRepository.findByUserId(userId);
    }


};