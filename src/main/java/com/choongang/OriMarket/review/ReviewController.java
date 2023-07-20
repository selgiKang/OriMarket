package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.store.BusinessStoreService;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
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

    private final ItemRepository itemRepository;
    private final BusinessStoreService businessStoreService;

    @GetMapping("/user_review")
    public String userReview(@RequestParam("itemId") Long itemId,HttpSession session,Model model) {
        Item byId = itemRepository.findById(itemId).orElseThrow();
        model.addAttribute("abcde",byId);
        return "user/user_review";
    }

    @GetMapping("/businessReview")
    public String businessPageReview(@ModelAttribute Review review,BusinessStore businessStore,BusinessUser businessUser,Model model,HttpSession session){
        //사업자 번호
        BusinessStore findReview = businessStoreService.findReview(businessStore,businessUser,session);
        businessStore.setBuStoreNumber(findReview.getBuStoreNumber());

        //사업자 번호 일치하는 리뷰만 골라오기
        List<Review> reviewListResult = reviewService.findReview(review,businessStore);
        model.addAttribute("reviewList",reviewListResult);
        for(Review r : reviewListResult){
            System.out.println(r.getReview_id());
        }
        return "/business/businessReview/business_review";
    }

    @PostMapping("/user_review")
    public String userReivew1(@ModelAttribute Review review, HttpSession session, Model model){
        System.out.println(review.getItem().getItemId());
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
