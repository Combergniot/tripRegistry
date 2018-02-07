
package com.copernicana.tripregistry.controller;

import com.copernicana.tripregistry.model.CostEstimate;
import com.copernicana.tripregistry.model.trip.Trip;
import com.copernicana.tripregistry.repository.TripRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Controller
public class PdfGeneratorController {

    @Autowired
    private TripRepository tripRepository;

    @GetMapping("/generatePdf")
    public String getJspForPdf(
            Model model,
            @RequestParam(value = "tripId", required = true) Long tripId) {
        Trip trip = tripRepository.findOne(tripId);
        System.out.println("tripId: " + tripId);
        // System.out.println("trip :" + trip.getId());
        System.out.println(trip.getCompany().getName());
        model.addAttribute("trip", trip);

        return "zgloszenie_pdf";
    }

    @GetMapping("/costEstimateForm")
    public String getFormForPdf(
            Model model,
            @RequestParam(value = "tripId", required = true) Long tripId) {
        Trip trip = tripRepository.findOne(tripId);

        model.addAttribute("trip", trip);
        if (trip.getCostEstimate() == null) {
            model.addAttribute("costEstimate", new CostEstimate());
        } else {
            model.addAttribute("costEstimate", trip.getCostEstimate());
        }

        return "costEstimateForm";
    }

    @PostMapping("/costEstimateForm")
    public String saveFormForPdf(
            @ModelAttribute CostEstimate costEstimate,
            BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            System.out.println(bindingResult.getAllErrors());
        }
        Trip trip = tripRepository.findOne(costEstimate.getTrip().getId());

        costEstimate.setCreatedAt(new Date());
        trip.setCostEstimate(costEstimate);
        tripRepository.save(trip);

        return "redirect:/costEstimateForm?tripId="+trip.getId();
    }


}
