package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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

    private final FavService favService;
    private final UserService userService;
    private final ItemRepository itemRepository;

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

    @GetMapping("/store")
    public String store(@RequestParam("favStoreName") String favStoreName, Fav fav,User user, HttpSession session,Model model) {
        user.setUserId(String.valueOf(session.getAttribute("userId")));
        //회원
        if(userService.checkUserId(user.getUserId())) {

            user.setUserSeq(Long.valueOf(String.valueOf(session.getAttribute("userSeq"))));
            fav.setUserSeq(user);
            System.out.println("번호 나오니"+fav.getUserSeq());

            if(favService.favFavorite(fav.getUserSeq(),favStoreName)){
                session.setAttribute("favNumber",1);

            }else{
                session.setAttribute("favNumber","");
            }
            //session.setAttribute("favNumber", fav.getFavNumber());
            List<Item> all = itemRepository.findAll();
            model.addAttribute("al",all);
            return "store/store";
        //비회원
        }else{
            return "store/store";
        }
    }

}
