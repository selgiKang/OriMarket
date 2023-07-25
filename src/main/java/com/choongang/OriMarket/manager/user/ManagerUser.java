package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.business.market.Market;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.mapping.ToOne;

import javax.persistence.*;

@Entity
@Table(name="manager_user")
@Data
@NoArgsConstructor
public class ManagerUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long managerSeq;

    @Column
    private String managerId;

    @Column
    private String managerPassword;

    @Column
    private String managerName;

    @Column
    private String managerPhone;

    @Column
    private String managerEmail;

    //시장 seq
    @ManyToOne
    @JoinColumn(name = "marketSeq")
    private Market market;

}

