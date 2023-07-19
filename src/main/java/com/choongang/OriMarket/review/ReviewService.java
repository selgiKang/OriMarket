package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.Store;
import com.choongang.OriMarket.store.StoreRepository;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Slf4j
public class ReviewService {

    @Autowired
    private final ReviewRepository reviewRepository;

    private final UserRepository userRepository;

    public void save(Review review, HttpSession session){
        User byId = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
        review.setUser(byId);
        review.setBusinessStore(byId.getItems().get(0).getBusinessStore());
        reviewRepository.save(review);
    }

}
