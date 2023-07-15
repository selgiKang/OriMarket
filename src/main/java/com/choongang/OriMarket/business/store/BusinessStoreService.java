package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Slf4j
public class BusinessStoreService {

    @Autowired
    private final BusinessStoreRepository businessStoreRepository;


    public void save(BusinessStore businessStore){
        businessStoreRepository.save(businessStore);

    }


}
