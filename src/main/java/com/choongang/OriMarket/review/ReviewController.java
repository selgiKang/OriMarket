package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
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

    @GetMapping("/user_review")
    public String userReview(@RequestParam("itemId") Long itemId,HttpSession session,Model model) {
        Item byId = itemRepository.findById(itemId).orElseThrow();
        model.addAttribute("abcde",byId);
        return "user/user_review";
    }

    @PostMapping("/user_review")
    public String userReivew1(@ModelAttribute Review review, HttpSession session, Model model){
        reviewService.save(review,session,model);
        return  "user/user_reviewlist";
    }


};
