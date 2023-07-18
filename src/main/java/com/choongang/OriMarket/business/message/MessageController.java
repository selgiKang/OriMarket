package com.choongang.OriMarket.business.message;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MessageController {

    @Autowired
    private final MessageService messageService;

    @GetMapping("/messageInsert")
    public String messageInsert(){
        return "business/businessMessage/business_message";
    }
    @GetMapping("/businessInsertMessage")
    public String businessInsertMessage(){
        return "business/businessMessage/message_insert";
    }
    @PostMapping("/messageInsert")
    public String messageInsertNew(@ModelAttribute Message messages,BusinessUser businessUser, HttpSession session){

        System.out.println("메세지:"+messages.getTotalMessage());
        System.out.println("사업자번호:"+session.getAttribute("buUserNumber").toString());
        Long buUserNumber = Long.parseLong(session.getAttribute("buUserNumber").toString());
        businessUser.setBuUserNumber(buUserNumber);
        messages.setBuUserNumber(businessUser);

        messageService.insertMessage(messages);

        return "business/businessMessage/business_message";
    }


}
