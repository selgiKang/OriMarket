package com.choongang.OriMarket.store;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.constraints.Pattern;
import java.util.List;

@Service
@Slf4j
public class ItemService {

    @Autowired
    private final ItemRepository itemRepository;

    public ItemService(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }


    public Item getItem(String itemName){
        Item item = itemRepository.findByItemName(itemName);
        return item;
    }


    public Long saveItem(Item item){

        itemRepository.save(item);
        return item.getItemId();
    }
}
