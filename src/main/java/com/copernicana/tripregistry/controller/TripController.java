package com.copernicana.tripregistry.controller;

import com.copernicana.tripregistry.model.trip.Accomodation;
import com.copernicana.tripregistry.model.trip.Meal;
import com.copernicana.tripregistry.model.trip.guideusage.Sightseeing;
import com.copernicana.tripregistry.repository.EditTripDao;
import com.copernicana.tripregistry.repository.GuideRepository;
import com.copernicana.tripregistry.repository.TripRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TripController {

    @Autowired
    TripRepository tripRepository;
    @Autowired
    EditTripDao editTripDao;
    @Autowired
    GuideRepository guideRepository;

    @PostMapping(value = "/deleteTrip/{id}")
    public String deleteTrip(@PathVariable Long id) {

        try {
            tripRepository.delete(id);
            return "redirect:/sightseeings?deleteSuccess=true";

        } catch (Exception e) {
            return "redirect:/sightseeings?deleteSuccess=false";
        }

    }

    @GetMapping("showTrip")
    public String showTripById(@RequestParam(value = "id", required = true) Long id, Model model) {
        model.addAttribute("trip", tripRepository.findOne(id));
        model.addAttribute("meal", new Meal());
        model.addAttribute("accomodation",new Accomodation());
        model.addAttribute("guides",guideRepository.findAll());
        model.addAttribute("sightseeing", new Sightseeing());
        return "tripDetails";
    }

    @PostMapping(value = "/updateGroupType/{groupId}/{tripId}/{groupType}")
    public String updateGroupType(
            @PathVariable("groupId") Long groupId,
            @PathVariable("tripId") Long tripId,
            @PathVariable("groupType") String groupType,
            @RequestParam("newGroupType") String newGroupType) {

        editTripDao.updateGroupType(newGroupType, groupId, tripId);

        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/updateGroupRemarks/{groupId}/{tripId}")
    public String updateGroupRemarks(
            @PathVariable("groupId") Long groupId,
            @PathVariable("tripId") Long tripId,
            @RequestParam("remarks") String remarks) {

        editTripDao.updateGroupRemarks(tripId, groupId, remarks);

        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/updateGuideRemarks/{groupId}/{tripId}")
    public String updateGuideRemarks(
            @PathVariable("groupId") Long groupId,
            @PathVariable("tripId") Long tripId,
            @RequestParam("remarks") String remarks) {

        editTripDao.updateGuideRemarks(tripId, groupId, remarks);

        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/updateCompany/{tripId}")
    public String updateCompanyForTrip(
            @PathVariable("tripId") Long tripId,
            @RequestParam("company") Long newCompanyId) {
        editTripDao.updateCompanyForTrip(tripId, newCompanyId);
        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/updatePeopleNumber/{tripId}/{groupId}")
    public String updateGroupAge(
            @PathVariable("tripId") Long tripId,
            @PathVariable("groupId") Long groupId,
            @RequestParam("children") int children,
            @RequestParam("adults") int adults,
            @RequestParam("staff") int staff
    ) {
        editTripDao.updatePeopleNumber(groupId, tripId, children, adults, staff);

        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/updateTripStatus/{tripId}")
    public String updateTripStatus(
            @PathVariable("tripId") Long tripId,
            @RequestParam(value = "status", defaultValue = "0") int tripStatus) {
        boolean advance = false;
        boolean confirmed = false;
        boolean cancelled = false;

        if (tripStatus == 0) {
            advance = true;
            confirmed = true;
            cancelled = false;
        } else if (tripStatus == 1) {
            advance = false;
            confirmed = true;
            cancelled = false;
        } else if (tripStatus == 2) {
            advance = false;
            confirmed = false;
            cancelled = false;
        } else if (tripStatus == 3) {
            cancelled = true;
            advance = false;
            confirmed = false;
        }

        editTripDao.updateTripStatus(tripId, advance, confirmed, cancelled);
        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/removeMealFromTrip/{tripId}/{mealId}")
    public String removeMeal(
            @PathVariable("mealId") Long mealId,
            @PathVariable("tripId") Long tripId) {

        editTripDao.removeMeal(mealId);
        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/addMealToTrip/{tripId}")
    public String addMeal(@ModelAttribute("meal") Meal meal,
                          @PathVariable("tripId") Long tripId
    ) {

        editTripDao.addMeal(tripId, meal);
        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/addAccommodationToTrip/{tripId}")
    public String addAccommodation(@ModelAttribute("accommodation") Accomodation accomodation,
                                   @PathVariable("tripId") Long tripId
    ) {
        editTripDao.addAccommodation(tripId, accomodation);
        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/removeAccommodationFromTrip/{tripId}/{accommodationId}")
    public String removeAccommodation(
            @PathVariable("accommodationId") Long accommodationId,
            @PathVariable("tripId") Long tripId) {

        editTripDao.removeAccommodation(accommodationId);
        return "redirect:/showTrip?id=" + tripId;
    }

//
//        @PostMapping(value = "/addAttractionToTrip/{tripId}")
//    public String addAttraction(@ModelAttribute("attraction")Attraction attraction,
//                          @PathVariable("tripId") Long tripId
//    ) {
//        editTripDao.addAttraction(tripId, attraction);
//        return "redirect:/showTrip?id=" + tripId;
//    }
//
//
//    @PostMapping(value = "/removeAttractionFromTrip/{tripId}/{attractionId}")
//    public String removeAttraction(
//            @PathVariable("attractionId") Long attractionId,
//            @PathVariable("tripId") Long tripId) {
//
//        editTripDao.removeAttraction(attractionId);
//        return "redirect:/showTrip?id=" + tripId;
//    }

    @PostMapping(value = "/removeGuideFromService/{tripId}/{serviceId}/{guideId}")
    public String removeGuide(
            @PathVariable("serviceId") Long serviceId,
            @PathVariable("tripId") Long tripId,
            @PathVariable("guideId") Long guideId) {

        editTripDao.removeGuideFromSightseeing(serviceId, guideId);
        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/addGuideToService/{tripId}")
    public String addGuide(
            @RequestParam("serviceId") Long serviceId,
            @PathVariable("tripId") Long tripId,
            @RequestParam(value = "guideId") long guideId) {

        editTripDao.addGuideToSightseeing(serviceId, guideId);
        return "redirect:/showTrip?id=" + tripId;
    }

    @PostMapping(value = "/addSightseeingToTrip/{tripId}")
    public String addSightseeing(@ModelAttribute("sightseeing")Sightseeing sightseeing,
                                   @PathVariable("tripId") Long tripId
    ) {
        editTripDao.addSightseeing(tripId, sightseeing);
        return "redirect:/showTrip?id=" + tripId;
    }

}
