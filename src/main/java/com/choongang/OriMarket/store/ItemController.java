package com.choongang.OriMarket.store;

import org.springframework.web.bind.annotation.GetMapping;

public class ItemController {

    private final ItemService itemService;

    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }

    @GetMapping("/item/new")
    public String create(Item item){
        Item saveItem = new Item();
        saveItem.setItemName(item.getItemName());
        saveItem.setItemPrice(item.getItemPrice());
        saveItem.setItemCnt(item.getItemCnt());
        saveItem.setItemG(item.getItemG());
        saveItem.setItemFrom(item.getItemFrom());

        itemService.saveItem(saveItem);
        return "redirect:/";
    }
/*
    @GetMapping("/items")
    public String list(Model model){
        List<Item> itmes = itemService.findItems();
        model.addAttribute("items",items);
        return "items/itemList";
    }
*/

}

