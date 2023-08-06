package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.store.BusinessStoreService;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import com.choongang.OriMarket.order.NewOrderDetail;
import com.choongang.OriMarket.order.NewOrderDetailRepository;
import com.choongang.OriMarket.utill.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class ReviewController {

    private final ReviewService reviewService;
    private final BusinessStoreService businessStoreService;
    private final NewOrderDetailRepository newOrderDetailRepository;
    private final ImageService imageService;
    private final BusinessStoreRepository businessStoreRepository;
    private final ReviewRepository reviewRepository;
    private final BusinessUserRepository businessUserRepository;

    @GetMapping("/user_review")
    public String userReview(@RequestParam("buStoreName") String buStoreName, @RequestParam("orderNumber") String orderNumber, Model model) {
        List<NewOrderDetail> byBuStoreName = newOrderDetailRepository.findByBuStoreNameAndOrderNumber(buStoreName, orderNumber);
        model.addAttribute("abcde", byBuStoreName);
        return "user/user_review";
    }

    @GetMapping("/businessReview")
    public String businessPageReview(@ModelAttribute Review review, BusinessStore businessStore, BusinessUser businessUser, Model model, HttpSession session) {
        //사업자 번호
        BusinessStore findReviewResult = businessStoreService.findReview(businessStore, businessUser, session);

        //사업자 번호 일치하는 리뷰만 골라오기
        List<Review> reviewListResult = reviewService.findReview(review, findReviewResult);

        if (reviewListResult.size() == 1) {
            model.addAttribute("aveRating", reviewListResult.get(0).getRating());
            model.addAttribute("reviewcount", 1);
        } else {
            //리뷰 총점 계산
            int totalSum = 0;
            int reviewCount = reviewListResult.size();
            for (Review review1 : reviewListResult) {
                if (review1.getRating() != null) {
                    int rating = review1.getRating();
                    totalSum += rating;
                }
            }
            double averageRating = (double) totalSum / reviewCount;
            model.addAttribute("aveRating", averageRating);
            model.addAttribute("reviewcount", reviewCount);
        }

        model.addAttribute("reviewList", reviewListResult);
        return "/business/businessReview/business_review";
    }

    @GetMapping("/storeReview")
    public String storeReview(@ModelAttribute Review review, BusinessStore businessStore, BusinessUser businessUser, Model model, HttpSession session) {
        //사업자 번호
        BusinessStore findReviewResult = businessStoreService.findReview(businessStore, businessUser, session);
        //사업자 번호 일치하는 리뷰만 골라오기
        List<Review> reviewListResult = reviewService.findReview(review, findReviewResult);
        //리뷰 총점 계산
        int totalSum = 0;
        int reviewCount = reviewListResult.size();
        for (Review review1 : reviewListResult) {
            if (review1.getRating() != null) {
                int rating = review1.getRating();
                totalSum += rating;
            }
        }
        double averageRating = (double) totalSum / reviewCount;
        model.addAttribute("aveRating", averageRating);
        model.addAttribute("reviewList", reviewListResult);
        return "/store/store_review";
    }

    @PostMapping("/user_review")
    public String userReivew1(@ModelAttribute Review review, @RequestParam("pictureUrl1") MultipartFile file, HttpSession session, Model model) throws IOException {
        String s = imageService.saveReviewImage(file);
        reviewService.save(review, session, s);

        return "redirect:/review";
    }

    @PostMapping("/ReplyInsert")
    public String replyInsert(@ModelAttribute Review review, Model model) {
        reviewService.replyMessageInsert(review, model);
        return "redirect:/businessReview";
    }

    @GetMapping("/ReplyInsert")
    public String replyInsert2(@ModelAttribute Review review, Model model) {
        reviewService.replyMessageInsert(review, model);
        return "business/businessReview/business_review";
    }

    @GetMapping("/storeReview1")
    public String storeReview1(HttpSession session, Model model) {
        BusinessUser businessNumber1 = businessUserRepository.findById((Long) session.getAttribute("businessNumber")).orElseThrow();
        BusinessStore businessNumber = businessStoreRepository.findByBusinessUser(businessNumber1);
        List<Review> reviews = businessNumber.getReviews();
        model.addAttribute("reviewList", reviews);
        model.addAttribute("buStore", businessNumber);

        List<Review> reviewListResult = reviewRepository.findByBusinessStore(businessNumber);

        if (reviewListResult.size() == 1) {
            model.addAttribute("aveRating", reviewListResult.get(0).getRating());
            model.addAttribute("reviewcount", 1);
        } else {
            //리뷰 총점 계산
            int totalSum = 0;
            int reviewCount = reviewListResult.size();
            for (Review review1 : reviewListResult) {
                if (review1.getRating() != null) {
                    int rating = review1.getRating();
                    totalSum += rating;
                }
            }
            double averageRating = (double) totalSum / reviewCount;
            model.addAttribute("aveRating", averageRating);
            model.addAttribute("reviewcount", reviewCount);
        }

        return "store/store_review1";
    }

}
