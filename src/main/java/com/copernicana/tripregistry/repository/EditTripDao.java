package com.copernicana.tripregistry.repository;

import com.copernicana.tripregistry.model.trip.Accomodation;
import com.copernicana.tripregistry.model.trip.Guide;
import com.copernicana.tripregistry.model.trip.Meal;
import com.copernicana.tripregistry.model.trip.Trip;
import com.copernicana.tripregistry.model.trip.guideusage.GuideUsage;
import com.copernicana.tripregistry.model.trip.guideusage.Sightseeing;
import com.copernicana.tripregistry.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Repository
public class EditTripDao {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private TripService tripService;

    @Autowired
    private MealRepository mealRepository;

    @Autowired
    private AccommodationRepository accommodationRepository;

    @Autowired
    private GuideRepository guideRepository;

    @Autowired
    private GuideUsageRepository guideUsageRepository;

    @Autowired
    private SightseeingRepository sightseeingRepository;


//    @Autowired
//    private AttractionRepository attractionRepository;

    private Trip getTripById(Long tripId) {
        return tripService.getOneTrip(tripId);
    }


    @Transactional
    public int updateGroupType(String groupType, Long groupId, Long tripId) {

        String hql = "UPDATE Group set age = :grouptype"
                + " WHERE id = :groupid"
                + " AND trip.id = :tripid";
        Query query = em.createQuery(hql);
        query.setParameter("grouptype", groupType);
        query.setParameter("groupid", groupId);
        query.setParameter("tripid", tripId);
        int result = query.executeUpdate();
        // System.out.println("Rows affected: " + result);

        return result;
    }

    @Transactional
    public int updateCompanyForTrip(Long tripId, Long newCompanyId) {
        String hql = "UPDATE Trip set company.id = :newcompanyid"
                + " WHERE id = :tripid";
        Query query = em.createQuery(hql);
        query.setParameter("newcompanyid", newCompanyId);
        query.setParameter("tripid", tripId);
        int result = query.executeUpdate();
        System.out.println("Rows affected: " + result);
        return result;
    }

    @Transactional
    public int updateGroupRemarks(Long tripId, Long groupId, String remarks) {
        String hql = "UPDATE Group set remarks = :remarks"
                + " WHERE id = :groupid"
                + " AND trip.id = :tripid";
        Query query = em.createQuery(hql);
        query.setParameter("remarks", remarks);
        query.setParameter("groupid", groupId);
        query.setParameter("tripid", tripId);
        int result = query.executeUpdate();
        return result;
    }

    @Transactional
    public int updateTripStatus(Long tripId, boolean advance, boolean confirmed, boolean cancelled) {
        String hql = "UPDATE Trip set advance = :advance,"
                + "confirmed = :confirmed,"
                + "cancelled = :cancelled"
                + " WHERE id = :tripid";
        Query query = em.createQuery(hql);
        query.setParameter("advance", advance);
        query.setParameter("confirmed", confirmed);
        query.setParameter("cancelled", cancelled);
        query.setParameter("tripid", tripId);
        int result = query.executeUpdate();
        System.out.println("Rows affected: " + result);
        return result;
    }

    public int updateDateFrom(Long tripId, String dateFrom) {
        return 1;
    }

    public int updateDateTo(Long tripId, String dateTo) {
        return 1;
    }

    @Transactional
    public int updatePeopleNumber(Long groupId, Long tripId, int children, int adults, int staff) {
        String hql = "UPDATE Group set adultsNo = :adults,"
                + "childrenNo = :children,"
                + "staffNo = :staff"
                + " WHERE id = :groupid"
                + " AND trip.id = :tripid";
        Query query = em.createQuery(hql);
        query.setParameter("adults", adults);
        query.setParameter("children", children);
        query.setParameter("staff", staff);
        query.setParameter("tripid", tripId);
        query.setParameter("groupid", groupId);
        int result = query.executeUpdate();
        System.out.println("Rows affected: " + result);
        return result;
    }

    public void addMeal(Long tripId, Meal meal) {
        mealRepository.save(meal);
    }

    public void removeMeal(long mealId) {
        mealRepository.delete(mealId);
    }

    public void addAccommodation(Long tripId, Accomodation accomodation) {
        accommodationRepository.save(accomodation);
    }

    public void removeAccommodation(Long accommodationId) {
        accommodationRepository.delete(accommodationId);
    }

    public int addService(Long tripId, Sightseeing sightseeing) {
        return 1;
    }

    public int removeService(Long tripId, int sightseeingId) {
        return 1;
    }


//    public void addAttraction(Long tripId, Attraction attraction)
//    {attractionRepository.save(attraction);
//    }
//
//    public void removeAttraction(Long attractionId)
//    {attractionRepository.delete(attractionId);
//    }

    @Transactional
    public void removeGuideFromSightseeing(Long seeingId, Long guideId) {
        GuideUsage guideUsage = guideUsageRepository.findOne(seeingId);
        Guide guide = guideRepository.findOne(guideId);
        guideUsage.getGuides().remove(guide);
        guideUsageRepository.save(guideUsage);
    }

    @Transactional
    public void addGuideToSightseeing(Long seeingId, Long guideId) {
        GuideUsage guideUsage = guideUsageRepository.findOne(seeingId);
        Guide guide = guideRepository.findOne(guideId);
        guideUsage.getGuides().add(guide);
        guideUsageRepository.save(guideUsage);
    }

    @Transactional
    public int updateGuideRemarks(Long tripId, Long groupId, String remarks) {
        String hql = "UPDATE Sightseeing set remarks = :remarks"
                + " WHERE id = :groupid"
                + " AND trip.id = :tripid";
        Query query = em.createQuery(hql);
        query.setParameter("remarks", remarks);
        query.setParameter("groupid", groupId);
        query.setParameter("tripid", tripId);
        int result = query.executeUpdate();
        return result;
    }

    public void addSightseeing(Long tripId, Sightseeing sightseeing) {
        sightseeingRepository.save(sightseeing);
    }

    public void removeSightseeing(long sightseeingId) {
       sightseeingRepository.delete(sightseeingId);
    }
}
