package com.choongang.OriMarket.store;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ItemService {

    @Autowired
    private final ItemRepository itemRepository;

    private final BusinessUserRepository businessUserRepository;

    private final BusinessStoreRepository businessStoreRepository;


    public Item getItem(Long itemId){
        Item item = itemRepository.findByItemId(itemId);
        return item;
    }


    public Long saveItem(Item item){

        itemRepository.save(item);
        return item.getItemId();
    }

    public void save(Item item, HttpSession session, Model model){
        BusinessUser buUserNumber = businessUserRepository.findById((Long) session.getAttribute("buUserNumber")).orElseThrow();
        item.setBusinessStore(buUserNumber.getBusinessStores().get(0));
        itemRepository.save(item);

        List<Item> items1 = buUserNumber.getBusinessStores().get(0).getItems();
        for (Item item1: items1){
            System.out.println("키키키:"+item1.getBusinessStore().getBuStoreName());
        }
        model.addAttribute("items",items1);

    }

    public List<Item> searchItem(String searchKeyword){
        List<Item> byItemNameContaining = itemRepository.findByItemNameContaining(searchKeyword);

        if(byItemNameContaining.isEmpty()){
            return byItemNameContaining;
        }else {
            return byItemNameContaining;
        }


    }


}
