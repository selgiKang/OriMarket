package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.store.Store;
import com.choongang.OriMarket.store.StoreRepository;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    private final ItemRepository itemRepository;

    private final BusinessStoreRepository businessStoreRepository;

    public void save(Review review, HttpSession session, Model model){
        User byId = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
        review.setUser(byId);
        Item byId1 = itemRepository.findById(review.getItem().getItemId()).orElseThrow();
        review.setBusinessStore(byId1.getBusinessStore());
        reviewRepository.save(review);
        BusinessStore businessStore = byId1.getBusinessStore();
        List<Review> reviews = byId.getReviews();

        List<Review> reviewListResult = reviewRepository.findByBusinessStore(businessStore);
        //리뷰 총점 계산
        int totalSum = 0;
        int reviewCount = reviewListResult.size();
        for(Review review1:reviewListResult){
            int rating = review1.getRating();
            totalSum += rating;
        }
        double averageRating = (double) totalSum / reviewCount;
        model.addAttribute("aveRating",averageRating);


        model.addAttribute("re",reviews);
    }

    public List<Review> findReview(Review review,BusinessStore businessStore){
        List<Review> findReviewResult= reviewRepository.findByBusinessStore(businessStore);
        return findReviewResult;
    }

    public void replyMessageInsert(Review reviews,Model model){
       Review resultList = reviewRepository.findById(reviews.getReview_id()).orElseThrow();
      System.out.println("수정 메세지: "+reviews.getBusinessReplyMessage());
      resultList.setBusinessReplyMessage(reviews.getBusinessReplyMessage());

       Review saveReply = reviewRepository.save(resultList);
       Review updatedReview = reviewRepository.findById(saveReply.getReview_id()).orElseThrow();
       model.addAttribute("reviewList",updatedReview);


    }


}
