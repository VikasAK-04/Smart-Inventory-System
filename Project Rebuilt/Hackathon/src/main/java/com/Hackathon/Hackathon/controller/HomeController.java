package com.Hackathon.Hackathon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/route-planner")
    public String showRoutePlanner(Model model) {
        String origin = "Chennai, India";
        String destination = "Bangalore, India";

        model.addAttribute("origin", origin);
        model.addAttribute("destination", destination);

        return "routePlanner"; // JSP: /WEB-INF/jsp/routePlanner.jsp
    }
}