package com.choongang.OriMarket.order;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Slf4j
public class OrderService {

    @Autowired
    private  final OrderRepository orderRepository;


}
