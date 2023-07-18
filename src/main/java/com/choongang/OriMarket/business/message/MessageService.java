package com.choongang.OriMarket.business.message;

import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
@Slf4j
public class MessageService {

    @Autowired
    private final MessageRepository messageRepository;

    public boolean insertMessage(Message message){
        Message savemessage = messageRepository.save(message);

       if(savemessage == null){
           return false;
       }else {
           return true;
       }
    }

}
