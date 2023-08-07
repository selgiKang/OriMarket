package com.choongang.OriMarket.business.message;

import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class MessageService {

    private final MessageRepository messageRepository;

    //게시글 등록
    public boolean insertMessage(Message message) {
        Message savemessage = messageRepository.save(message);

        if (savemessage == null) {
            return false;
        } else {
            return true;
        }
    }

    //게시글 찾기
    public List<Message> getMessages(BusinessUser buUserNumber, Model model) {
        List<Message> getMessage = messageRepository.findByBuUserNumber(buUserNumber);
        return getMessage;
    }

    public Message getDetailMessage(Long messageId) {
        Message getDetailMessage = messageRepository.findByMessageId(messageId);
        return getDetailMessage;
    }

    public boolean getEditMessage(Message message) {
        Message editmessage = messageRepository.save(message);
        if (editmessage == null) {
            return false;
        } else {
            return true;
        }
    }

    //삭제
    public void getDeleteMessage(Long messageId) {
        Message getDeleteMessage = messageRepository.findByMessageId(messageId);
        messageRepository.delete(getDeleteMessage);
    }
}
