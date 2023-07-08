package com.choongang.OriMarket.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;


@Controller
public class TestController {

    public class Post{
        public  Post(int a,String b,String c){

        }

    }
    @RequestMapping("/post")
    public String test(Model model) {
        Post post1 = new Post(1, "lee", "book1");
        Post post2 = new Post(2, "choi", "book2");
        Post post3 = new Post(3, "kim", "book3");
        List<Post> list = new ArrayList<>();
        list.add(post1);
        list.add(post2);
        list.add(post3);
        model.addAttribute("list", list);
        return "user/mypage";
    }
}