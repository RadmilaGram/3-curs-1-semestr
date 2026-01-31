package com.example.quizApp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @GetMapping("/start")
    public String start(@RequestParam String user, Model model) {
        model.addAttribute("user", user);
        return "start";
    }
}

