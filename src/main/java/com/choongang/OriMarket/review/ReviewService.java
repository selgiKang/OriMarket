package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.order.NewOrderDetail;
import com.choongang.OriMarket.order.NewOrderDetailRepository;
import com.choongang.OriMarket.order.NewOrderRepository;
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

    private final NewOrderDetailRepository newOrderDetailRepository;
    public void save(Review review, HttpSession session, Model model, List<String> imageUrls){

        System.out.println("뉴오더시퀀스:"+review.getNewOrder());
        System.out.println("주문번호"+review.getOrderNumber());
        System.out.println("가게이름:"+review.getBuStoreName());
        System.out.println("물건이름:"+review.getItemName());
        System.out.println("별점:"+review.getRating());
        System.out.println("맛:"+review.getTaste());
        System.out.println("양:"+review.getAmount());
        System.out.println("내용:"+review.getContent());

        for(String s:imageUrls) {
            System.out.println("히히히정보:" + s);
        }


        List<NewOrderDetail> byBuStoreNameAndOrderNumber = newOrderDetailRepository.findByBuStoreNameAndOrderNumber(review.getBuStoreName(), review.getOrderNumber());
        for(NewOrderDetail newOrderDetail:byBuStoreNameAndOrderNumber){
            newOrderDetail.setReviewtrue("리뷰");
            newOrderDetailRepository.save(newOrderDetail);
        }

        String[] itemNames = review.getItemName().split(",");
        for(String item:itemNames) {
            Review newReview = new Review();
            User byUser = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
            Item byItemName = itemRepository.findByItemNameAndBusinessStore_BuStoreName(item, review.getBuStoreName());
            BusinessStore byBuStore = businessStoreRepository.findById(byItemName.getBusinessStore().getBuStoreNumber()).orElseThrow();
            newReview.setNewOrder(review.getNewOrder());
            newReview.setBuStoreName(review.getBuStoreName());
            newReview.setItemName(review.getItemName());
            newReview.setRating(review.getRating());
            newReview.setTaste(review.getTaste());
            newReview.setAmount(review.getAmount());
            newReview.setContent(review.getContent());
            newReview.setOrderNumber(review.getOrderNumber());
            newReview.setItem(byItemName);
            newReview.setBusinessStore(byBuStore);
            newReview.setUser(byUser);
            reviewRepository.save(newReview);
        }

        /*//리뷰 총점 계산
        int totalSum = 0;
        int reviewCount = reviewListResult.size();
        for(Review review1:reviewListResult){
            if(review1.getRating()!=null){
                int rating = review1.getRating();
                totalSum += rating;
            }
        }
        double averageRating = (double) totalSum / reviewCount;
        model.addAttribute("aveRating",averageRating);*/
        /*model.addAttribute("re",reviews);*/
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
