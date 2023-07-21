package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.business.message.Message;
import com.choongang.OriMarket.business.message.MessageRepository;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
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


    @GetMapping("/storeFav")
    public String storeFav(@RequestParam(value = "favId",required = false) Long favId, User user, Fav fav, HttpSession session){

        // user.setUserSeq(Long.valueOf((String) session.getAttribute("userSeq")));

        if(favService.favFavorite(fav.getUserSeq(),fav.getFavStoreName())){
            favService.favDelete(fav.getUserSeq(), fav.getFavStoreName());
            fav.setFavNumber("");
            session.setAttribute("favNumber","");
        }else{
            favService.favInsert(fav);
            //데이터 베이스 x
            fav.setFavNumber("1");
            session.setAttribute("favNumber","1");
        }

       // System.out.println("찜 번호: "+favId);
        return "store/store";
    }

    @GetMapping("/store")
    public String store(@RequestParam("favStoreName") String favStoreName, Fav fav,User user, HttpSession session,Model model) {
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
            List<Item> items = byBuStoreName.get(0).getItems();
            model.addAttribute("al", items);
            //공지사항
            BusinessUser buStoreNumber = items.get(0).getBusinessStore().getBusinessUser();
            session.setAttribute("buUserNumber",buStoreNumber.getBuUserNumber());
            List<Message> messageList = messageRepository.findByBuUserNumber(buStoreNumber);

            //Message lastM = messageList.get(messageList.size()-1);
           //model.addAttribute("lastM",lastM);
            if(messageList != null){
                Message lastM = messageList.get(messageList.size()-1);
                model.addAttribute("lastM",lastM);
            }

            return "store/store";
            //비회원
        } else {
            return "store/store";
        }
    }

}
