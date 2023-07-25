package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.business.message.Message;
import com.choongang.OriMarket.business.message.MessageRepository;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.review.ReviewRepository;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FavController {

    @Autowired
    private final FavService favService;
    private final UserService userService;
    private final ItemRepository itemRepository;
    private final BusinessStoreRepository businessStoreRepository;
    private final MessageRepository messageRepository;

    private final ReviewRepository reviewRepository;


    @GetMapping("/storeFav")
    public String storeFav(@RequestParam(value = "favId",required = false) Long favId, User user, Fav fav, HttpSession session,Model model){

        // user.setUserSeq(Long.valueOf((String) session.getAttribute("userSeq")));
        List<BusinessStore> byBuStoreName = businessStoreRepository.findByBuStoreName(fav.getFavStoreName());

        List<Item> items = byBuStoreName.get(0).getItems();
        model.addAttribute("al", items);

            if(favService.favFavorite(fav.getUserSeq(),fav.getFavStoreName())){
                favService.favDelete(fav.getUserSeq(), fav.getFavStoreName());
                fav.setFavNumber("");
                session.setAttribute("favNumber","");
            }else {
                favService.favInsert(fav);
                //데이터 베이스 x
                fav.setFavNumber("1");
                session.setAttribute("favNumber", "1");
            }

        //리뷰 평점계산
        List<Review> reviewListResult = reviewRepository.findByBusinessStore(byBuStoreName.get(0));
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

        //공지사항
        BusinessUser buStoreNumber = items.get(0).getBusinessStore().getBusinessUser();
        session.setAttribute("buUserNumber",buStoreNumber.getBuUserNumber());

        List<Message> messageList = messageRepository.findByBuUserNumber(buStoreNumber);

        if(!messageList.isEmpty()){
            Message lastM = messageList.get(messageList.size()-1);
            model.addAttribute("lastM",lastM);
        }

       // System.out.println("찜 번호: "+favId);
        return "store/store";
    }

    @GetMapping("/store")
    public String store(@RequestParam("favStoreName") String favStoreName,
                        @RequestParam(value = "favId",required = false) Long favId,
                        Fav fav,User user, HttpSession session,Model model) {

        user.setUserId(String.valueOf(session.getAttribute("userId")));


        //회원
        if (userService.checkUserId(user.getUserId())) {

            user.setUserSeq(Long.valueOf(String.valueOf(session.getAttribute("userSeq"))));
            //즐겨찾기 되어있는건지 안되어있는건지 확인만!
            fav.setUserSeq(user);
            fav.setFavStoreName(favStoreName);
            System.out.println("번호 나오니" + fav.getUserSeq());

            if (favService.favFavorite(fav.getUserSeq(), favStoreName)) {
                session.setAttribute("favNumber", 1);

            } else {
                session.setAttribute("favNumber", "");
            }

            //session.setAttribute("favNumber", fav.getFavNumber());
            List<BusinessStore> byBuStoreName = businessStoreRepository.findByBuStoreName(favStoreName);
            System.out.println("이건모라고나올까요??"+byBuStoreName.get(0).getBuStoreImageUrl());

            //리뷰 평점계산
            List<Review> reviewListResult = reviewRepository.findByBusinessStore(byBuStoreName.get(0));
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

            //확실해지면 model로 변해도 됨
            //시장 번호
            Long marketSeq = byBuStoreName.get(0).getMarket().getMarketSeq();
            session.setAttribute("marketSeq",marketSeq);

            //사업자번호
            Long businessNumber = byBuStoreName.get(0).getBusinessUser().getBuUserNumber();
            session.setAttribute("businessNumber",businessNumber);

            //시장 이름
            String marketName = byBuStoreName.get(0).getMarket().getMarketName();
            session.setAttribute("marketName",marketName);

            //물건 목록
            List<Item> items = byBuStoreName.get(0).getItems();
            model.addAttribute("al", items);

            //가게 이미지 정보
            String buStoreImageUrl = byBuStoreName.get(0).getBuStoreImageUrl();
            System.out.println("이건머라고나오띾요?:"+buStoreImageUrl);
            session.setAttribute("buStoreImage",buStoreImageUrl);

            //공지사항
            BusinessUser buStoreNumber = items.get(0).getBusinessStore().getBusinessUser();
            session.setAttribute("buUserNumber",buStoreNumber.getBuUserNumber());

            List<Message> messageList = messageRepository.findByBuUserNumber(buStoreNumber);

            if(!messageList.isEmpty()){
                Message lastM = messageList.get(messageList.size()-1);
                model.addAttribute("lastM",lastM);
            }

            return "store/store";
            //비회원
        } else {
            return "store/store";
        }
    }

    @GetMapping("/favList")
    public String favStoreList(User user,HttpSession session,Model model){
        Long userSeq = Long.valueOf((session.getAttribute("userSeq")).toString());
        user.setUserSeq(userSeq);
       if(favService.favList(user) != null){
           List<Fav> fResult = favService.favList(user);
           model.addAttribute("favResult",fResult);
           model.addAttribute("favs",1);
           return "user/favStoreList";
       }else{

           model.addAttribute("favs",0);
           return "user/favStoreList";
       }

    }

}
