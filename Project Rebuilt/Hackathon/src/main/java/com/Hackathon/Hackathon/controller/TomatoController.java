package com.Hackathon.Hackathon.controller;

import com.Hackathon.Hackathon.model.Tomato;
import com.Hackathon.Hackathon.service.TomatoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TomatoController {

    @Autowired
    private TomatoService tomatoService;

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        model.addAttribute("tomatoes", tomatoService.getAllTomatoes());
        return "tomatoDashboard"; // this resolves to templates/tomatoDashboard.html
    }

    @GetMapping("/manual-entry")
    public String showManualEntryForm() {
        return "manualEntryForm"; // This MUST match the JSP filename (without `.jsp`)
    }

    @PostMapping("/addManual")
    public String addManualTomato(@RequestParam int freshnessDays, Model model) {
        tomatoService.addManualTomato(freshnessDays);
        model.addAttribute("message", "Tomato added successfully!");
        return "redirect:/dashboard"; // Ensure successful redirection
    }

    @PostMapping("/scan")
    public String scanTomato(@RequestParam int freshnessDays) {
        tomatoService.scanTomato(freshnessDays);
        return "redirect:/dashboard"; // Refresh the dashboard
    }

    @PostMapping("/api/scan")
    @ResponseBody
    public String scanFromEsp32(@RequestParam int freshnessDays) {
        tomatoService.scanTomato(freshnessDays);
        return "Saved from ESP32"; // API response
    }

    @GetMapping("/api/tomatoes")
    @ResponseBody
    public List<Tomato> getTomatoes() {
        return tomatoService.getAllTomatoes(); // Returns JSON data
    }
}