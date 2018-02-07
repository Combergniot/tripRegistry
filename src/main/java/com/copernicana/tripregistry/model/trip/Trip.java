package com.copernicana.tripregistry.model.trip;

import com.copernicana.tripregistry.model.CostEstimate;
import com.copernicana.tripregistry.model.trip.attraction.AdditionalAttractions;
import com.copernicana.tripregistry.model.trip.attraction.Attraction;
import com.copernicana.tripregistry.model.trip.guideusage.GuideUsage;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "WYCIECZKI")
public class Trip {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateFrom;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateTo;
    
    private boolean confirmed;
    private boolean advance;
    private boolean cancelled;
    private String accountExecutive;
    
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "trip")
    private CostEstimate costEstimate;

    // Cascade is to ensure that company is not deleted when Trip is deleted 
    @ManyToOne(cascade = {CascadeType.REFRESH, CascadeType.MERGE, CascadeType.PERSIST})
    private Company company;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "trip")
    private Group group;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "trip")
    private List<Meal> meals;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "trip")
    private List<Accomodation> accomodations;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "trip")
    private List<GuideUsage> attractionsWithGuide;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "trip")
    private List<Attraction> attractions;

//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "trip")
//    private List<AdditionalAttractions> additionalAttractions;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public List<Meal> getMeals() {
        return meals;
    }

    public void setMeals(List<Meal> meals) {
        this.meals = meals;
    }

    public List<Accomodation> getAccomodations() {
        return accomodations;
    }

    public void setAccomodations(List<Accomodation> accomodations) {
        this.accomodations = accomodations;
    }

    public List<GuideUsage> getAttractionsWithGuide() {
        return attractionsWithGuide;
    }

    public void setAttractionsWithGuide(List<GuideUsage> attractionsWithGuide) {
        this.attractionsWithGuide = attractionsWithGuide;
    }

    public List<Attraction> getAttractions() {
        return attractions;
    }

    public void setAttractions(List<Attraction> attractions) {
        this.attractions = attractions;
    }

    public boolean isConfirmed() {
        return confirmed;
    }

    public void setConfirmed(boolean confirmed) {
        this.confirmed = confirmed;
    }

    public boolean isAdvance() {
        return advance;
    }

    public void setAdvance(boolean advance) {
        this.advance = advance;
    }

    public CostEstimate getCostEstimate() {
        return costEstimate;
    }

    public void setCostEstimate(CostEstimate costEstimate) {
        this.costEstimate = costEstimate;
    }

    public boolean isCancelled() {
        return cancelled;
    }

    public void setCancelled(boolean cancelled) {
        this.cancelled = cancelled;
    }

    public String getAccountExecutive() {
        return accountExecutive;
    }

    public void setAccountExecutive(String accountExecutive) {
        this.accountExecutive = accountExecutive;
    }

    //    public List<AdditionalAttractions> getAdditionalAttractions() {
//        return additionalAttractions;
//    }
//
//    public void setAdditionalAttractions(List<AdditionalAttractions> additionalAttractions) {
//        this.additionalAttractions = additionalAttractions;
//    }

}
