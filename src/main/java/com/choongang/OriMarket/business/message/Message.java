package com.choongang.OriMarket.business.message;

import com.choongang.OriMarket.business.user.BusinessUser;
import lombok.*;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name="business_message")
@Getter
@Setter
@NoArgsConstructor
public class Message {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //게시판 번호: 기본키
    private Long messageId;

    //제목
    @Column(name = "message_title")
    private String messageTitle;

    //내용
    @Column(length = 1000)
    private String totalMessage;

    //작성 날짜
    @Column(name = "message_insert_date")
    private String messageInsertDate;

    //사업자번호
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="bu_user_number")
    private BusinessUser buUserNumber;

}
