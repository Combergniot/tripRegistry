package com.copernicana.tripregistry.controller;

import com.copernicana.tripregistry.model.trip.Trip;
import com.copernicana.tripregistry.repository.GuideRepository;
import com.copernicana.tripregistry.service.MainFormDataConverter;
import com.copernicana.tripregistry.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.text.ParseException;
import java.util.Map;

@Controller
public class AddTripController {

    @Autowired private MainFormDataConverter formDataConverter;
    @Autowired private TripService tripService;
    @Autowired private GuideRepository guideRepository;

    @GetMapping({"/addTrip", "/"})
    public String getMainForm(Model model) {
        
        model.addAttribute("guides", guideRepository.findAll());

        return "mainForm_1";
    }

    @GetMapping("/addTrip1")
    public String getMainForm1(Model model) {

        return "mainForm_1";
    }

    @PostMapping({"/addTrip", "/"})
    public String handleMainForm(Model model,
            @RequestParam Map<String, String> params,
            @RequestParam MultiValueMap<String, String> multiParams,
            @RequestParam(value = "childrenNr", defaultValue = "0") String[] childrenNr,
            @RequestParam(value = "AdultsNr", defaultValue = "0") String[] adultsNr,
            @RequestParam(value = "StaffNr", defaultValue = "0") String[] staffNr,
            @RequestParam(value = "groupType", defaultValue = "Nie wybrano") String[] groupType,
            @RequestParam(value = "groupTypeRemarks", defaultValue = "Brak") String[] groupTypeRemarks,
            @RequestParam(value = "mealsType", required = false) String[] mealsType,
            @RequestParam(value = "feedDate", required = false) String[] feedDate,
            @RequestParam(value = "feedHourStart", required = false) String[] feedHourStart,
            @RequestParam(value = "feedHourEnd", required = false) String[] feedHourEnd,
            @RequestParam(value = "feedingPlace", required = false) String[] feedingPlace,
            @RequestParam(value = "feedRemarks", required = false, defaultValue = "Brak") String[] feedRemarks,
            @RequestParam(value = "tourType", defaultValue = "Tradycyjne 2h") String[] tourType,
            @RequestParam(value = "attractions", required = false, defaultValue = "Brak") String[] attractions,
            @RequestParam(value = "serviceDate", required = false) String[] serviceDate,
            @RequestParam(value = "attractionTimeStart", required = false) String[] attractionTimeStart,
            @RequestParam(value = "attractionTimeEnd", required = false) String[] attractionTimeEnd,
            @RequestParam(value = "languages", defaultValue = "polski", required = false) String[] languages,
            @RequestParam(value = "tourRemarks", required = false, defaultValue = "Brak") String[] tourRemarks,
            @RequestParam(value = "mainAttractionChained", required = false) String[] mainAttractionChained,
            @RequestParam(value = "mainAttractionDate", required = false) String[] mainAttractionDate,
            @RequestParam(value = "mainAttractionTimeStart", required = false) String[] mainAttractionTimeStart,
            @RequestParam(value = "mainAttractionTimeEnd", required = false) String[] mainAttractionTimeEnd,
            @RequestParam(value = "mainAttractionRemarks", required = false, defaultValue = "Brak") String[] mainAttractionRemarks,
            @RequestParam(value = "additionalAttractionType", required = false) String[] additionalAttractionType,
            @RequestParam(value = "addAttractionTimeEnd", required = false) String[] additionalAttractionTimeEnd,
            @RequestParam(value = "addAttractionDate", required = false) String[] additionalAttractionDate,
            @RequestParam(value = "addAttractionTimeStart", required = false) String[] additionalAttractionTimeStart,
            @RequestParam(value = "addAttractionRemarks", required = false, defaultValue = "Brak") String[] additionalAttractionRemarks,
                                 Principal principal
            
    ) throws ParseException {

        System.out.println("Pryncypał!!! przypał " + principal.getName());

        if (params.get("company") == null) {
            params.put("company", "9");
        }

        if (params.get("status-selector") == null) {
            params.put("status-selector", "2");
        }
        
        if (params.get("acomHotel") != null && params.get("acomRemarks") == null) {
            params.put("acomRemarks", "Brak");
        }
        

        try {
            Trip trip
                    = formDataConverter.convertToTrip(
                            params,
                            multiParams,
                            childrenNr,
                            adultsNr,
                            staffNr,
                            groupType,
                            groupTypeRemarks,
                            mealsType,
                            feedDate,
                            feedHourStart,
                            feedHourEnd,
                            feedRemarks,
                            feedingPlace,
                            tourType,
                            attractions,
                            serviceDate,
                            attractionTimeStart,
                            attractionTimeEnd,
                            languages,
                            tourRemarks,
                            mainAttractionChained,
                            mainAttractionDate,
                            mainAttractionTimeStart,
                            mainAttractionTimeEnd,
                            mainAttractionRemarks,
                            additionalAttractionType,
                            additionalAttractionTimeEnd,
                            additionalAttractionDate,
                            additionalAttractionTimeStart,
                            additionalAttractionRemarks,
                    principal
                    );

            tripService.addTrip(trip);

            return "redirect:addTrip?addSuccess=true";

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:addTrip?addSuccess=false&errorMessage=" + e.toString();
        }

    }

}
