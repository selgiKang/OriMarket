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

    @GetMapping("/storeFav")
    public String storeFav(@RequestParam(value = "favId",required = false) Long favId, User user, Fav fav, HttpSession session){

        // user.setUserSeq(Long.valueOf((String) session.getAttribute("userSeq")));

        if(favService.favFavorite(fav.getUserSeq(),fav.getFavStoreName())){
            favService.favDelete(fav.getUserSeq(), fav.getFavStoreName());
           fav.setFavNumber("");
            session.setAttribute("favNumber",String.valueOf(fav.getFavNumber()));
        }else{
            favService.favInsert(fav);
            fav.setFavNumber("1");
            session.setAttribute("favNumber",String.valueOf(fav.getFavNumber()));
        }

        session.setAttribute("favNumber", fav.getFavNumber());

        System.out.println("찜 번호: "+favId);
        return "store/store";
    }
}
