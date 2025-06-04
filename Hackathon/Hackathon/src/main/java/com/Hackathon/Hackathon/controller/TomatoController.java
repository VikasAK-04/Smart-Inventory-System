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
        List<Tomato> freshTomatoes = tomatoService.getAllTomatoes(); // must hit DB
        model.addAttribute("tomatoes", freshTomatoes);
        return "tomatoDashboard";
    }

    //  Manual Form View
    @GetMapping("/manual-entry")
    public String showManualEntryForm() {
        return "manualEntryForm";
    }

    // Manual Entry Submission (random tag + weight)
    @PostMapping("/addManual")
    public String addManualTomato(@RequestParam int freshnessDays) {
        tomatoService.addManualTomato(freshnessDays);
        return "redirect:/dashboard"; // will auto-refresh from DB
    }

    // Web Form Scan Submission (from UI form)
    @PostMapping("/scan")
    public String scanTomato(@RequestParam int freshnessDays) {
        tomatoService.scanTomato(freshnessDays);
        return "redirect:/dashboard"; // will auto-refresh from DB
    }

    // ESP32 RFID Data Submission
    @PostMapping("/api/scan")
    @ResponseBody
    public String scanFromEsp32(@RequestParam int freshnessDays) {
        tomatoService.scanTomato(freshnessDays);
        return "Saved from ESP32";
    }

    // REST API to get all tomatoes as JSON
    @GetMapping("/api/tomatoes")
    @ResponseBody
    public List<Tomato> getTomatoes() {
        return tomatoService.getAllTomatoes();
    }
}
