package com.choongang.OriMarket.review;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreService;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class PictureUrlController {

//    @PostMapping("/api/v1/users/images/{userId}")
//    public Map<String, Object> updateUserProfile(@PathVariable("userId") Long userId, @RequestBody MultipartFile file)  {
//        ImageDto imageDto = updateProfile(file);
//        if(imageDto.getContent()==null) {
//            return imageDto.getMap();
//        }
//        userImageService.update(userService.findOneById(userId), (Image) imageDto.getContent());
//        return imageDto.getMap();
//    }

};
