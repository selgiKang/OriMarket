package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FavController {

    private final FavService favService;

    @GetMapping("/storeFav/{userSeq}")
    public String storeFav(@PathVariable(name="userSeq") String userSeq,
                           @RequestParam(value = "favId",required = false) Long favId, User user, Fav fav, HttpSession session){

        user.setUserSeq(Long.valueOf(userSeq));

        if(favService.favFavorite(user,fav.getFavStoreName())){
            favService.favDelete(user, fav.getFavStoreName());
            session.setAttribute("favNumber",String.valueOf(fav.getFavNumber()));


        }else{
            fav.setFavNumber("1");
            favService.favInsert(fav);
            session.setAttribute("favNumber",String.valueOf(fav.getFavNumber()));
        }

        System.out.println("찜 번호: "+favId);
        return "store/store";
    }
}
