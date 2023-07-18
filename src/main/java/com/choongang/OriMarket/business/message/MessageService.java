package com.choongang.OriMarket.business.message;

import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class MessageService {

    @Autowired
    private final MessageRepository messageRepository;

    //게시글 등록
    public boolean insertMessage(Message message){
        Message savemessage = messageRepository.save(message);

       if(savemessage == null){
           return false;
       }else {
           return true;
       }
    }

    //게시글 찾기
    public List<Message> getMessages(BusinessUser buUserNumber, Model model){
        List<Message> getMessage = messageRepository.findByBuUserNumber(buUserNumber);
        return getMessage;
    }
}
