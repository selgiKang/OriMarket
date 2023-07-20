package com.choongang.OriMarket.main;

import com.choongang.OriMarket.user.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {

    @Autowired
    private final MainService mainService;

    private final UserRepository userRepository;

    private final UserAddressRepository userAddressRepository;

    @GetMapping("/")
    public String main(HttpSession session, Model model) {
        return "main/main";
    }

    @GetMapping("/connexion_market")
    public String connexion_market() {
        return "main/connexion_market0";
    }

    @GetMapping("/main0")
    public String main0() {return "main/main0";}

    @GetMapping("/index")
    public String index() {
        return "main/index";
    }

    @GetMapping("/search")
    public String search(HttpSession session,Model model) {
        User findUser = userRepository.findByUserId(String.valueOf(session.getAttribute("userId")));
        List<UserAddress> userAddresses = findUser.getUserAddresses();
        model.addAttribute("userAd",userAddresses);
        return "main/search";
    }

    @GetMapping("/mylocation")
    public String test(HttpSession session,Model model){
        User findUser = userRepository.findByUserId(String.valueOf(session.getAttribute("userId")));
        List<UserAddress> userAddresses = findUser.getUserAddresses();
        model.addAttribute("userAd",userAddresses);
        return "main/mylocation";}

    @PostMapping("/search")
    public String search1(@ModelAttribute UserAddress userAddress, HttpSession session, Model model){
        mainService.updateAddress(session,userAddress,model);
        return "main/search";
    }

    @GetMapping("/deleteAddress")
    public String deleteAddress(@RequestParam("userAddressSeq") Long userAddressSeq,HttpSession session,Model model) {
        UserAddress byId = userAddressRepository.findById(userAddressSeq).orElseThrow();
        userAddressRepository.delete(byId);
        User findUser = userRepository.findByUserId(String.valueOf(session.getAttribute("userId")));
        List<UserAddress> userAddresses = findUser.getUserAddresses();
        model.addAttribute("userAd",userAddresses);
        return "main/search";
    }

    @GetMapping("/updateAddress")
    public String updateAddress(@RequestParam("userAddressSeq") Long userAddressSeq, Model model,HttpSession session) {
        UserAddress byId = userAddressRepository.findById(userAddressSeq).orElseThrow();

        session.setAttribute("userAddress1", byId.getUserAddress1());
        session.setAttribute("userAddressDetail1", byId.getUserAddressDetail1());

        List<UserAddress> userAddresses = byId.getUser().getUserAddresses();
        model.addAttribute("userAd",userAddresses);

        return "main/search";
    }




};

