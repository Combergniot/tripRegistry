package com.copernicana.tripregistry.controller;

import com.copernicana.tripregistry.model.trip.guideusage.Sightseeing;
import com.copernicana.tripregistry.repository.*;
import com.copernicana.tripregistry.service.SightseeingService;
import com.copernicana.tripregistry.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReportController {
     
    @Autowired private TripService tripService;
    @Autowired private SightseeingService sightseeingService;
    @Autowired private PlanetariumRepository planetariumRepository;
    @Autowired private GingerbreadRepository gingerbreadRepository;
    @Autowired private FortIVRepository fortIVRepository;
    @Autowired private BeerRepository beerRepository;
    @Autowired private MealRepository mealRepository;
    @Autowired private MillRepository millRepository;
    @Autowired private CruiseRepository cruiseRepository;
    @Autowired private TeutonicCastleRepository teutonicCastleRepository;
    @Autowired private AdditionalAttractionsRepository additionalAttractionsRepository;
    @Autowired private MuseumRepository museumRepository;
    @Autowired private AccommodationRepository accommodationRepository;
    
    
    
    @GetMapping("/sightseeings")
    public String getSightseeingsReport(Model model) {
        final Iterable<Sightseeing> allSighteeings = sightseeingService.getAllSighteeings();
        model.addAttribute("seeings", allSighteeings);

        return "sightseeings";
    }
    
    @GetMapping("/gesia")
    public String getGesiaReport(Model model) {
        model.addAttribute("meals", mealRepository.findAll());
        return "meals";
    }
    
      @GetMapping("/planetarium")
    public String getPlanetariumReport(Model model) {
        model.addAttribute("planets", planetariumRepository.findAll());
        return "planetariums";
    }
    
        @GetMapping("/gingerbread")
    public String getGingerbreadReport(Model model) {
        model.addAttribute("gingerbreads", gingerbreadRepository.findAll());
        return "gingerbread";
    }
    
       @GetMapping("/fort")
    public String getFortReport(Model model) {
        model.addAttribute("forts4", fortIVRepository.findAll());
        return "fort4";
    }
    
       @GetMapping("/olbracht")
    public String getOlbrachtReport(Model model) {
        model.addAttribute("beers", beerRepository.findAll());
        return "beer";
    }
    
     @GetMapping("/mlyny")
    public String getMillsReport(Model model) {
        model.addAttribute("mills", millRepository.findAll());
        return "mill";
    }

    @GetMapping("/castle")
    public String getCastleReport(Model model) {
        model.addAttribute("castle", teutonicCastleRepository.findAll());
        return "teutonicCastle";
    }

    @GetMapping("/cruise")
    public String getCruiseReport(Model model) {
        model.addAttribute("cruises", cruiseRepository.findAll());
        return "cruise";
    }

    @GetMapping("/additional")
    public String getAddtitionalAttractionReport(Model model) {
        model.addAttribute("additionalAttractions", additionalAttractionsRepository.findAll());
        return "additional";
    }
    @GetMapping("/museum")
    public String getMuseumReport(Model model) {
        model.addAttribute("museums", museumRepository.findAll());
        return "museum";
    }

    @GetMapping("/mainReport")
    public String getMainReport(Model model) {
        final Iterable<Sightseeing> allSighteeings = sightseeingService.getAllSighteeings();
        model.addAttribute("seeings", allSighteeings);
        return "mainReport";
    }

    @GetMapping("/accommodation")
    public String getAccomodationReport(Model model) {
        model.addAttribute("accommodations", accommodationRepository.findAll());
        return "accommodation";
    }

}
