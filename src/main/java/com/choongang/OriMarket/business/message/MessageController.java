package com.choongang.OriMarket.business.message;

import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
// 스프링에서 DI(의존성 주입)의 방법 중에 생성자 주입을 임의의 코드없이 자동으로 설정해주는 어노테이션, final 필드나 @NonNull이 붙은 필드에 대해 생성자 생성
@Log4j2
public class MessageController {

    private final MessageService messageService;

    //메세지 목록 입장 및 출력
    @GetMapping("/messageInsert")
    public String messageInsert(@ModelAttribute Message message, Model model, HttpSession session, BusinessUser businessUser) {
        Long buUserNumber = (Long) session.getAttribute("buUserNumber");
        if (buUserNumber != null) {
            businessUser.setBuUserNumber(buUserNumber);

            List<Message> resultMessage = messageService.getMessages(businessUser, model);
            if (resultMessage != null) {
                model.addAttribute("resultMessage", resultMessage);
            }
        }
        return "business/businessMessage/business_message";
    }

    @GetMapping("/storeMessageInsert")
    public String storeMessageInsert(@ModelAttribute Message message, Model model, HttpSession session, BusinessUser businessUser) {
        businessUser.setBuUserNumber(Long.valueOf(session.getAttribute("buUserNumber").toString()));
        List<Message> resultMessage = messageService.getMessages(businessUser, model);
        model.addAttribute("resultMessage", resultMessage);
        return "store/store_message";
    }

    @GetMapping("/businessInsertMessage")
    public String businessInsertMessage() {
        return "business/businessMessage/message_insert";
    }

    //메세지 상세 조회
    @GetMapping("/message_detail/{messageId}")
    public String businessDetailMessage(@PathVariable("messageId") String messageId, Model model) {

        Long editMessageId = Long.valueOf(messageId);
        Message getmessage = messageService.getDetailMessage(editMessageId);
        model.addAttribute("getmessages", getmessage);

        return "business/businessMessage/business_detail_message";
    }

    //수정 이동
    @GetMapping("/message_edit/{messageId}")
    public String businessEditPage(@PathVariable("messageId") String messageId, Model model) {

        Long editMessageId = Long.valueOf(messageId);
        Message getmessage = messageService.getDetailMessage(editMessageId);
        model.addAttribute("getmessages", getmessage);

        return "business/businessMessage/business_edit_message";
    }

    //삭제
    @GetMapping("/message_delete/{messageId}")
    public String messageDelete(@PathVariable("messageId") String messageId) {
        Long editMessageId = Long.valueOf(messageId);
        messageService.getDeleteMessage(editMessageId);

        return "redirect:/messageInsert";
    }


    //수정
    @PostMapping("message_edit/{messageId}")
    public String businessEditMessage(@PathVariable("messageId") String messageId, @ModelAttribute Message messages, BusinessUser businessUser, HttpSession session) {

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String today = dateFormat.format(date);

        Long editMessageId = Long.valueOf(messageId);
        businessUser.setBuUserNumber(Long.valueOf(session.getAttribute("buUserNumber").toString()));

        messages.setMessageId(editMessageId);
        messages.setBuUserNumber(businessUser);
        messages.setMessageInsertDate(today);

        boolean m = messageService.getEditMessage(messages);
        if (m) {
            return "redirect:/messageInsert";
        } else {
            return "message_edit/" + messageId;
        }
    }

    //메세지 등록
    @PostMapping("/messageInsert")
    public String messageInsertNew(@ModelAttribute Message messages, BusinessUser businessUser, HttpSession session) {

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String today = dateFormat.format(date);

        Long buUserNumber = Long.parseLong(session.getAttribute("buUserNumber").toString());
        businessUser.setBuUserNumber(buUserNumber);

        messages.setBuUserNumber(businessUser);
        messages.setMessageInsertDate(today);

        messageService.insertMessage(messages);
        return "redirect:/messageInsert";
    }


    @PostMapping("/messageInsertMain")
    @ResponseBody
    public ResponseEntity<String> messageInsertMain(@RequestBody Message requestData, BusinessUser businessUser, HttpSession session) {
        // 요청 처리 로직 작성
        try {
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String today = dateFormat.format(date);

            Long buUserNumber = Long.parseLong(session.getAttribute("buUserNumber").toString());
            businessUser.setBuUserNumber(buUserNumber);

            requestData.setBuUserNumber(businessUser);
            requestData.setMessageInsertDate(today);

            messageService.insertMessage(requestData);

            return ResponseEntity.ok("요청이 성공적으로 처리되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("요청 처리 중 오류가 발생했습니다.");
        }
    }

}
