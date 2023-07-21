package com.choongang.OriMarket.marketmap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ConnexionController {

    private final ConnexionService connexionService;

    @Autowired
    public ConnexionController(ConnexionService connexionService) {
        this.connexionService = connexionService;
    }

    @GetMapping("/main")
    public String mainPage(Model model) {
        List<Connexion> connexions = connexionService.getAllConnexions();
        model.addAttribute("connexions", connexions);
        return "main"; // main.html 뷰 페이지로 이동
    }
}