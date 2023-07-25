/*
package com.choongang.OriMarket.pay;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "PAYMENT_TBL")
@Getter
@Setter
@NoArgsConstructor
@Slf4j
public class KakaoPay {

    @Id
    @SequenceGenerator(name = "seq_payment_code", sequenceName = "SEQ_PAYMENT_CODE", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_payment_code")
    @Column(name = "PAY_CODE")
    private Long payCode;

    @Column(name = "ODR_CODE", nullable = false)
    private Long orderCode;

    @Column(name = "PAY_METHOD", nullable = false, length = 30)
    private String paymentMethod;

    @Column(name = "PAY_DATE", columnDefinition = "DATE DEFAULT SYSDATE")
    private Date paymentDate;

    @Column(name = "PAY_TOT_PRICE", nullable = false)
    private Double totalPaymentPrice;

    @Column(name = "PAY_REST_PRICE", nullable = false)
    private Double remainingPaymentPrice;

    @Column(name = "PAY_NOBANK_USER", length = 20)
    private String nonBankPaymentUser;

    @Column(name = "PAY_NOBANK", length = 20)
    private String nonBankPaymentInfo;

}
*/
