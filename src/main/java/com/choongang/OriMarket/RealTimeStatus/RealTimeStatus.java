/*
package com.choongang.OriMarket.RealTimeStatus;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "realTimeStatus")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RealTimeStatus {

    @Id
    @Column(name="rts_number",nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long rtsNumber;

    //주문번호
    @Column
    private String rtsorderNumber;


    //픽업중
    @Column
    @Builder.Default
    private  int rtsOrderIng=0;

    //배송중
    @Column
    @Builder.Default
    private int rtsRiderIng=0;
    
    //배달 완료
    @Column
    @Builder.Default
    private int rtsRiderFinish=0;

}
*/
