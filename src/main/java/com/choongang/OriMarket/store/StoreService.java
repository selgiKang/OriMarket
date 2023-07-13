package com.choongang.OriMarket.store;

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
public class StoreService {

    @Autowired
    private final StoreRepository storeRepository;

    EntityManager em;

    public Store update(Store store){

        storeRepository.save(store);
        return store;
    }
    
}
