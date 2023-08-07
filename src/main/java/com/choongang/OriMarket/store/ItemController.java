package com.choongang.OriMarket.store;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Log4j2
public class ItemController {

    private final ItemService itemService;

    @GetMapping("/item/new")
    public String create(Item item) {
        Item saveItem = new Item();
        saveItem.setItemName(item.getItemName());
        saveItem.setItemPrice(item.getItemPrice());
        saveItem.setItemCnt(item.getItemCnt());
        saveItem.setItemG(item.getItemG());
        saveItem.setItemFrom(item.getItemFrom());

        itemService.saveItem(saveItem);
        return "redirect:/";
    }

}

