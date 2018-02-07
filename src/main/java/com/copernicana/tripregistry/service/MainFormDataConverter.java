package com.copernicana.tripregistry.service;

import com.copernicana.tripregistry.controller.AddTripController;
import com.copernicana.tripregistry.model.trip.Accomodation;
import com.copernicana.tripregistry.model.trip.Company;
import com.copernicana.tripregistry.model.trip.Group;
import com.copernicana.tripregistry.model.trip.Guide;
import com.copernicana.tripregistry.model.trip.Meal;
import com.copernicana.tripregistry.model.trip.Trip;
import com.copernicana.tripregistry.model.trip.attraction.AdditionalAttractions;
import com.copernicana.tripregistry.model.trip.attraction.Attraction;
import com.copernicana.tripregistry.model.trip.attraction.Beer;
import com.copernicana.tripregistry.model.trip.attraction.Cruise;
import com.copernicana.tripregistry.model.trip.attraction.FortIV;
import com.copernicana.tripregistry.model.trip.attraction.Gingerbread;
import com.copernicana.tripregistry.model.trip.attraction.Mill;
import com.copernicana.tripregistry.model.trip.attraction.Museum;
import com.copernicana.tripregistry.model.trip.attraction.Planetarium;
import com.copernicana.tripregistry.model.trip.attraction.TeutonicCastle;
import com.copernicana.tripregistry.model.trip.guideusage.GuideUsage;
import com.copernicana.tripregistry.model.trip.guideusage.Sightseeing;
import com.copernicana.tripregistry.repository.CompanyRepository;
import com.copernicana.tripregistry.repository.GuideRepository;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;

@Service
public class MainFormDataConverter {

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private GuideRepository guideRepository;

    public Trip convertToTrip(
            Map<String, String> params,
            MultiValueMap<String, String> multiParams,
            String[] childrenNr,
            String[] adultsNr,
            String[] staffNr,
            String[] groupType,
            String[] groupTypeRemarks,
            String[] mealsType,
            String[] feedDate,
            String[] feedHourStart,
            String[] feedHourEnd,
            String[] feedRemarks,
            String[] feedingPlace,
            String[] tourType,
            String[] attractions,
            String[] serviceDate,
            String[] attractionTimeStart,
            String[] attractionTimeEnd,
            String[] languages,
            String[] tourRemarks,
            String[] mainAttractionChained,
            String[] mainAttractionDate,
            String[] mainAttractionTimeStart,
            String[] mainAttractionTimeEnd,
            String[] mainAttractionRemarks,
            String[] additionalAttractionType,
            String[] additionalAttractionTimeEnd,
            String[] additionalAttractionDate,
            String[] additionalAttractionTimeStart,
            String[] additionalAttractionRemarks,
            Principal principal
    ) throws ParseException {

        // Date format for every date in form
        DateFormat format = new SimpleDateFormat("dd/MM/yyyy", new Locale.Builder().setLanguage("pl").setRegion("PL").build());

        // Start and end dates of the trip
        Date tripStartDate = new Date();
        Date tripEndDate = new Date();

        try {
            tripStartDate = format.parse(params.get("tripStartDate"));
            tripEndDate = format.parse(params.get("tripEndDate"));

        } catch (ParseException pe) {
            pe.printStackTrace();
        }

        // Initalize new trip with dates
        Trip trip = new Trip();
        trip.setDateFrom(tripStartDate);
        trip.setDateTo(tripEndDate);

        // set account executive for trip
        trip.setAccountExecutive(principal.getName());

        // Initalize group
        Group group = createGroup(adultsNr, childrenNr, staffNr, trip, groupType, groupTypeRemarks);
        trip.setGroup(group);

        // Initalize meals
        if (mealsType != null) {
            List<Meal> meals = createMeals(mealsType, feedingPlace, format, feedDate, feedHourStart, feedHourEnd, feedRemarks, trip);
            trip.setMeals(meals);
        }

        // Initalize company
        try {
            Company company = (Company) companyRepository.findOne(Long.parseLong(params.get("company")));
            company.getTrips().add(trip);
            trip.setCompany(company);
        } catch (Exception e) {
            throw new NullPointerException("Brak firmy w bazie!");
        }

        // Initialazie sightseeings
        if (tourType != null) {
            List<GuideUsage> sightseeings = createGuideUsages(tourType, format, serviceDate, attractionTimeStart, attractionTimeEnd, languages, tourRemarks, multiParams, attractions, trip);
            trip.setAttractionsWithGuide(sightseeings);
        }

        // Initalize accomodation
        if (!params.get("acomHotel").equals("0")) {
            System.out.println(params.get("acomHotel"));
            List<Accomodation> accomodations = createAccomodation(format, params, trip);
            trip.setAccomodations(accomodations);
        }

        //initalize trip status
        createTripStatus(params, trip);

        // initalize attractions
        if (mainAttractionChained != null) {
            trip.setAttractions(createAttractions(mainAttractionChained, mainAttractionDate, mainAttractionTimeStart, mainAttractionTimeEnd, mainAttractionRemarks, trip));
        }

        if (additionalAttractionType != null) {
            if (trip.getAttractions() == null) {
                trip.setAttractions(createAdditionalAttractions(trip, format, additionalAttractionType, additionalAttractionTimeEnd, additionalAttractionDate, additionalAttractionTimeStart, additionalAttractionRemarks));
            }
            trip.getAttractions().addAll(createAdditionalAttractions(trip, format, additionalAttractionType, additionalAttractionTimeEnd, additionalAttractionDate, additionalAttractionTimeStart, additionalAttractionRemarks));
        }

        return trip;

    }

    private List<Attraction> createAdditionalAttractions(Trip trip, DateFormat format, String[] additionalAttractionType, String[] additionalAttractionTimeEnd, String[] additionalAttractionDate, String[] additionalAttractionTimeStart, String[] additionalAttractionRemarks) {
        List<Attraction> additionalAttractions = new ArrayList<>();

        for (int i = 0; i < additionalAttractionType.length; i++) {
            Attraction aa = new AdditionalAttractions();

            Date addAttrDate = new Date();
            try {
                addAttrDate = format.parse(additionalAttractionDate[i]);
            } catch (ParseException pe) {
                pe.printStackTrace();
            }
            aa.setDate(addAttrDate);
            aa.setHourFrom(additionalAttractionTimeStart[i]);
            aa.setHourTo(additionalAttractionTimeEnd[i]);
            aa.setRemarks(additionalAttractionRemarks[i]);
            aa.setName(additionalAttractionType[i]);
            aa.setTrip(trip);
            additionalAttractions.add(aa);
        }
        return additionalAttractions;
    }

    private void createTripStatus(Map<String, String> params, Trip trip) throws NumberFormatException {
        int tripStatusFromForm = Integer.parseInt(params.get("status-selector"));
        switch (tripStatusFromForm) {
            case 0:
                trip.setConfirmed(true);
                trip.setAdvance(true);
                break;
            case 1:
                trip.setConfirmed(true);
                trip.setAdvance(false);
                break;
            case 2:
                trip.setConfirmed(false);
                trip.setAdvance(false);
                break;
        }
    }

    private List<Accomodation> createAccomodation(DateFormat format, Map<String, String> params, Trip trip) {
        Date acomDateStart = new Date();
        Date acomDateEnd = new Date();
        try {
            acomDateStart = format.parse(params.get("acomDateStart"));
            acomDateEnd = format.parse(params.get("acomDateEnd"));

        } catch (ParseException pe) {
            pe.printStackTrace();
        }
        List<Accomodation> accomodations = new ArrayList<>();
        Accomodation accomodation = new Accomodation();
        accomodation.setDateFrom(acomDateStart);
        accomodation.setDateTo(acomDateEnd);
        accomodation.setHotelName(params.get("acomHotel"));
        accomodation.setRemarks(params.get("acomRemarks"));
        accomodation.setTrip(trip);
        accomodations.add(accomodation);
        return accomodations;
    }

    private List<GuideUsage> createGuideUsages(String[] tourType, DateFormat format, String[] serviceDate, String[] attractionTimeStart, String[] attractionTimeEnd, String[] languages, String[] tourRemarks, MultiValueMap<String, String> multiParams, String[] attractions, Trip trip) throws NumberFormatException {
        // Initalize guide usage
        List<GuideUsage> sightseeings = new ArrayList<>();

        if (tourType != null) {
            for (int i = 0; i < tourType.length; i++) {
                Sightseeing sightseeing = new Sightseeing();
                try {
                    sightseeing.setDate(format.parse(serviceDate[i]));
                } catch (ParseException ex) {
                    Logger.getLogger(AddTripController.class.getName()).log(Level.SEVERE, null, ex);
                }
                sightseeing.setHourFrom(attractionTimeStart[i]);
                sightseeing.setHourTo(attractionTimeEnd[i]);
                sightseeing.setName(tourType[i]);
                sightseeing.setRemarks(tourRemarks[i]);

                // add guides to tour
                List<Guide> guides = new ArrayList<>();

                Set<String> set2 = multiParams.keySet()
                        .stream()
                        .filter(s -> s.startsWith("pilotname"))
                        .collect(Collectors.toSet());

              //  System.out.println("TOUR TYPE: " + tourType[i]);
                List<String> get = multiParams.get("pilotname[" + i + "]");
                if (get != null) {
                    for (String value : get) {
                        Guide guide = new Guide();
                 //       System.out.println("Przewodnicy do zwiedzania! " + value);
                        guide = guideRepository.findOne(Long.parseLong(value));
                        guides.add(guide);
                    }
                    sightseeing.setGuides(guides);
                }

                // kaci, nalewki, etc.
                Set<String> addAttractions = multiParams.keySet()
                        .stream()
                        .filter(s -> s.startsWith("attractions"))
                        .collect(Collectors.toSet());

                List<String> addAttractionsStrings = multiParams.get("attractions["+i+"]");
                String addAtraction = "";
                for(String value : addAttractionsStrings){
                    addAtraction += " " + value+"<br>";
                }
                sightseeing.setAddition(addAtraction);


                // polski, rosyjski, etc
                Set<String> addLanguages = multiParams.keySet()
                        .stream()
                        .filter(s -> s.startsWith("languages"))
                        .collect(Collectors.toSet());

                List<String> addLanguagesStrings = multiParams.get("languages["+i+"]");
                String addLanguage = "";
                if(addLanguagesStrings != null) {
                    for (String value : addLanguagesStrings) {
                        addLanguage += " " + value + "<br>";
                    }
                    sightseeing.setLanguage(addLanguage);


                    sightseeing.setTrip(trip);
                    sightseeings.add(sightseeing);
                }
            }
        } // end of if for TourType null check
        return sightseeings;
    }

    private List<Meal> createMeals(String[] mealsType, String[] feedingPlace, DateFormat format, String[] feedDate, String[] feedHourStart, String[] feedHourEnd, String[] feedRemarks, Trip trip) {
        // Initalize meals
        List<Meal> meals = new ArrayList<>();
        for (int i = 0; i < mealsType.length; i++) {
            Meal meal = new Meal();
            meal.setMealType(mealsType[i]);
            meal.setPlace(feedingPlace[i]);
            // pobierz restauracje z bazy

            try {
                meal.setDate(format.parse(feedDate[i]));
            } catch (ParseException ex) {
                Logger.getLogger(AddTripController.class.getName()).log(Level.SEVERE, null, ex);
            }

            meal.setHourFrom(feedHourStart[i]);
            meal.setHourTo(feedHourEnd[i]);
            if (feedRemarks != null) {
                if (feedRemarks[i] != null) {
                    meal.setRemarks(feedRemarks[i]);
                }
            }

            meal.setTrip(trip);
            meals.add(meal);
        }
        return meals;
    }

    private Group createGroup(String[] adultsNr, String[] childrenNr, String[] staffNr, Trip trip, String[] groupType, String[] groupTypeRemarks) throws NumberFormatException {
        // Initalize new group
        // first element of array is in case there are multiple groups later
        Group group = new Group();
        group.setAdultsNo(Integer.parseInt(adultsNr[0]));
        group.setChildrenNo(Integer.parseInt(childrenNr[0]));
        group.setStaffNo(Integer.parseInt(staffNr[0]));
        group.setTrip(trip);
        group.setAge(groupType[0]);
        group.setRemarks(groupTypeRemarks[0]);
        return group;
    }

    private List<Attraction> createAttractions(String[] mainAttractions, String[] mainAttractionDate, String[] hoursFrom, String[] hoursTo, String[] remarks, Trip trip) throws ParseException {
        List<Attraction> attractions = new ArrayList<>();
        for (int i = 0; i < mainAttractions.length; i++) {
            int attractionCode = Integer.parseInt(mainAttractions[i]);
            attractions.add(setAttractionDetails(attractionCode, mainAttractionDate[i], hoursFrom[i], hoursTo[i], remarks[i], trip));

        }

        return attractions;
    }

    private Attraction setAttractionDetails(int attractionCode, String date, String hourFrom, String hourTo, String remarks, Trip trip) throws ParseException {
        Attraction attraction = null;

        switch (attractionCode) {
            case 1:
                Planetarium planetarium = new Planetarium();
                planetarium.setName("Planetarium: seans");
                planetarium.setTrip(trip);
                attraction = planetarium;
                break;

            case 2:
                Planetarium planetarium2 = new Planetarium();
                planetarium2.setName("Planetarium: Geodium");
                planetarium2.setTrip(trip);
                attraction = planetarium2;

                break;

            case 3:
                Planetarium planetarium3 = new Planetarium();
                planetarium3.setName("Planetarium: Orbitarium");
                planetarium3.setTrip(trip);
                attraction = planetarium3;

                break;

            case 4:
                Gingerbread gingerbread = new Gingerbread();
                gingerbread.setName("Pierniki: Piernikarnia Doroty");
                gingerbread.setTrip(trip);
                attraction = gingerbread;

                break;

            case 5:
                Gingerbread gingerbread2 = new Gingerbread();
                gingerbread2.setName("Pierniki: Muzeum Toruńskiego Piernika");
                gingerbread2.setTrip(trip);
                attraction = gingerbread2;

                break;

            case 6:
                Gingerbread gingerbread3 = new Gingerbread();
                gingerbread3.setName("Pierniki: Żywe Muzeum Piernika");
                gingerbread3.setTrip(trip);
                attraction = gingerbread3;

                break;

            case 7:
                Cruise cruise = new Cruise();
                cruise.setName("Rejs: Wanda");
                cruise.setTrip(trip);
                attraction = cruise;

                break;

            case 8:
                Cruise cruise2 = new Cruise();
                cruise2.setName("Rejs: Katarzynka");
                cruise2.setTrip(trip);
                attraction = cruise2;

                break;

            case 9:
                Cruise cruise3 = new Cruise();
                cruise3.setName("Rejs: Łodzie Flisacze");
                cruise3.setTrip(trip);
                attraction = cruise3;

                break;

            case 10:
                FortIV fortIV = new FortIV();
                fortIV.setName("Fort IV: Zwiedzanie - strój");
                fortIV.setTrip(trip);
                attraction = fortIV;

                break;

            case 11:
                FortIV fortIV2 = new FortIV();
                fortIV2.setName("Fort IV: Zwiedzanie - cywil");
                fortIV2.setTrip(trip);
                attraction = fortIV2;

                break;

            case 12:
                FortIV fortIV3 = new FortIV();
                fortIV3.setName("Fort IV: Zwiedzanie z duchami");
                fortIV3.setTrip(trip);
                attraction = fortIV3;

                break;

            case 13:
                FortIV fortIV4 = new FortIV();
                fortIV4.setName("Fort IV: Ognisko z kiełbaskami");
                fortIV4.setTrip(trip);
                attraction = fortIV4;

                break;

            case 14:
                FortIV fortIV5 = new FortIV();
                fortIV5.setName("Fort IV: Podchody");
                fortIV5.setTrip(trip);
                attraction = fortIV5;

                break;

            case 15:
                FortIV fortIV6 = new FortIV();
                fortIV6.setName("Fort IV: Gry i zabawy");
                fortIV6.setTrip(trip);
                attraction = fortIV6;

                break;

            case 16:
                Mill mill = new Mill();
                mill.setName("Młyny wiedzy: Zwiedzanie");
                mill.setTrip(trip);
                attraction = mill;

                break;

            case 17:
                Mill mill2 = new Mill();
                mill2.setName("Młyny wiedzy: Warsztaty");
                mill2.setTrip(trip);
                attraction = mill2;

                break;

            case 18:
                Museum museum = new Museum();
                museum.setName("Muzeum: Ratusz");
                museum.setTrip(trip);
                attraction = museum;

                break;

            case 19:
                Museum museum2 = new Museum();
                museum2.setName("Muzeum: Dom Mikołaja Kopernika");
                museum2.setTrip(trip);
                attraction = museum2;

                break;

            case 20:
                Museum museum3 = new Museum();
                museum3.setName("Muzeum: Dom Eskenów");
                museum3.setTrip(trip);
                attraction = museum3;

                break;

            case 21:
                Museum museum4 = new Museum();
                museum4.setName("Muzeum: Kamienica pod Gwiazdą");
                museum4.setTrip(trip);
                attraction = museum4;

                break;

            case 22:
                Museum museum5 = new Museum();
                museum5.setName("Muzeum: Muzeum Podróżników im. T.Halika");
                museum5.setTrip(trip);
                attraction = museum5;

                break;

            case 23:
                Museum museum6 = new Museum();
                museum6.setName("Muzeum: Muzeum Toruńskiego Piernika");
                museum6.setTrip(trip);
                attraction = museum6;

                break;

            case 24:
                TeutonicCastle teutonicCastle = new TeutonicCastle();
                teutonicCastle.setName("Zamek: Zwiedzanie");
                teutonicCastle.setTrip(trip);
                attraction = teutonicCastle;

                break;

            case 25:
                TeutonicCastle teutonicCastle2 = new TeutonicCastle();
                teutonicCastle2.setName("Zamek: Komturia");
                teutonicCastle2.setTrip(trip);
                attraction = teutonicCastle2;

                break;

            case 26:
                TeutonicCastle teutonicCastle3 = new TeutonicCastle();
                teutonicCastle3.setName("Zamek: Pokaz walk");
                teutonicCastle3.setTrip(trip);
                attraction = teutonicCastle3;

                break;

            case 27:
                Beer olbracht = new Beer();
                olbracht.setName("Olbracht: Degustacja");
                olbracht.setTrip(trip);
                attraction = olbracht;

                break;

            case 28:
                Beer olbracht2 = new Beer();
                olbracht2.setName("Olbracht: Zwiedzanie");
                olbracht2.setTrip(trip);
                attraction = olbracht2;

                break;

            case 29:
                Beer olbracht3 = new Beer();
                olbracht3.setName("Olbracht: Zakąski");
                olbracht3.setTrip(trip);
                attraction = olbracht3;

                break;

        }

        attraction.setRemarks(remarks);
        DateFormat format = new SimpleDateFormat("dd/MM/yyyy", new Locale.Builder().setLanguage("pl").setRegion("PL").build());
        attraction.setDate(format.parse(date));
        attraction.setHourFrom(hourFrom);
        attraction.setHourTo(hourTo);
        return attraction;
    }

}
