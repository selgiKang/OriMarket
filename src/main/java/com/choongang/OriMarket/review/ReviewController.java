package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.store.BusinessStoreService;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.order.NewOrderDetail;
import com.choongang.OriMarket.order.NewOrderDetailRepository;
import com.choongang.OriMarket.order.NewOrderRepository;
import com.choongang.OriMarket.store.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReviewController {

    @Autowired
    private final ReviewService reviewService;
    private final BusinessStoreService businessStoreService;
    private final NewOrderRepository newOrderRepository;
    private final NewOrderDetailRepository newOrderDetailRepository;

    @GetMapping("/user_review")
    public String userReview(@RequestParam("buStoreName") String buStoreName,HttpSession session,Model model) {
        List<NewOrderDetail> byBuStoreName = newOrderDetailRepository.findByBuStoreName(buStoreName);
        model.addAttribute("abcde",byBuStoreName);
        return "user/user_review";
    }

    @GetMapping("/businessReview")
    public String businessPageReview(@ModelAttribute Review review,BusinessStore businessStore,BusinessUser businessUser,Model model,HttpSession session){
        //사업자 번호
        BusinessStore findReviewResult = businessStoreService.findReview(businessStore,businessUser,session);
        //상점 번호
       // businessStore.setBuStoreNumber(findReview.getBuStoreNumber());

        //사업자 번호 일치하는 리뷰만 골라오기
        List<Review> reviewListResult = reviewService.findReview(review,findReviewResult);
        //리뷰 총점 계산
        int totalSum = 0;
        int reviewCount = reviewListResult.size();
        for(Review review1:reviewListResult){
            if(review1.getRating()!=null){
                int rating = review1.getRating();
                totalSum += rating;
            }
        }
        double averageRating = (double) totalSum / reviewCount;
        model.addAttribute("aveRating",averageRating);

        model.addAttribute("reviewList",reviewListResult);
        for(Review r : reviewListResult){
            System.out.println(r.getReview_id());
        }
        return "/business/businessReview/business_review";
    }
    @GetMapping("/storeReview")
    public String storeReview(@ModelAttribute Review review,BusinessStore businessStore,BusinessUser businessUser,Model model,HttpSession session){
        //사업자 번호
        BusinessStore findReviewResult = businessStoreService.findReview(businessStore,businessUser,session);
        //상점 번호
       // businessStore.setBuStoreNumber(findReview.getBuStoreNumber());
        //사업자 번호 일치하는 리뷰만 골라오기
        List<Review> reviewListResult = reviewService.findReview(review,findReviewResult);

        //리뷰 총점 계산
        int totalSum = 0;
        int reviewCount = reviewListResult.size();
        for(Review review1:reviewListResult){
            if(review1.getRating()!=null){
                int rating = review1.getRating();
                totalSum += rating;
            }
        }
        double averageRating = (double) totalSum / reviewCount;
        model.addAttribute("aveRating",averageRating);

        model.addAttribute("reviewList",reviewListResult);
        for(Review r : reviewListResult){
            System.out.println(r.getReview_id());
        }

        return "/store/store_review";
    }

    @PostMapping("/user_review")
    public String userReivew1(@ModelAttribute Review review, HttpSession session, Model model){
        reviewService.save(review,session,model);
        return  "user/user_reviewlist";
    }

    @PostMapping("/ReplyInsert")
    public String replyInsert(@ModelAttribute Review review,Model model){
        reviewService.replyMessageInsert(review,model);
        return "redirect:/businessReview";
    }
    @GetMapping("/ReplyInsert")
    public String replyInsert2(@ModelAttribute Review review,Model model){
        reviewService.replyMessageInsert(review,model);
        return "business/businessReview/business_review";
    }



};
