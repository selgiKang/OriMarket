package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.order.NewOrderDetail;
import com.choongang.OriMarket.order.NewOrderDetailRepository;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Log4j2
public class ReviewService {

    private final ReviewRepository reviewRepository;

    private final UserRepository userRepository;

    private final ItemRepository itemRepository;

    private final BusinessStoreRepository businessStoreRepository;

    private final NewOrderDetailRepository newOrderDetailRepository;

    public void save(Review review, HttpSession session, String s) {

        List<NewOrderDetail> byBuStoreNameAndOrderNumber = newOrderDetailRepository.findByBuStoreNameAndOrderNumber(review.getBuStoreName(), review.getOrderNumber());
        for (NewOrderDetail newOrderDetail : byBuStoreNameAndOrderNumber) {
            newOrderDetail.setReviewtrue("리뷰");
            newOrderDetailRepository.save(newOrderDetail);
        }

        String[] itemNames = review.getItemName().split(",");

        Review newReview = new Review();
        User byUser = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
        List<Item> byItemName = itemRepository.findByItemNameAndBusinessStore_BuStoreName(itemNames[0], review.getBuStoreName());
        BusinessStore byBuStore = businessStoreRepository.findById(byItemName.get(0).getBusinessStore().getBuStoreNumber()).orElseThrow();
        newReview.setNewOrder(review.getNewOrder());
        newReview.setBuStoreName(review.getBuStoreName());
        newReview.setItemName(review.getItemName());
        newReview.setRating(review.getRating());
        newReview.setTaste(review.getTaste());
        newReview.setAmount(review.getAmount());
        newReview.setContent(review.getContent());
        newReview.setOrderNumber(review.getOrderNumber());
        newReview.setBusinessStore(byBuStore);
        newReview.setUser(byUser);
        newReview.setPictureUrl(s);
        reviewRepository.save(newReview);
    }

    public List<Review> findReview(Review review, BusinessStore businessStore) {
        List<Review> findReviewResult = reviewRepository.findByBusinessStore(businessStore);
        return findReviewResult;
    }

    public void replyMessageInsert(Review reviews, Model model) {
        Review resultList = reviewRepository.findById(reviews.getReview_id()).orElseThrow();
        resultList.setBusinessReplyMessage(reviews.getBusinessReplyMessage());

        Review saveReply = reviewRepository.save(resultList);
        Review updatedReview = reviewRepository.findById(saveReply.getReview_id()).orElseThrow();
        model.addAttribute("reviewList", updatedReview);
    }
}
