package com.copernicana.tripregistry.model.trip.guideusage;

import com.copernicana.tripregistry.model.trip.Guide;
import com.copernicana.tripregistry.model.trip.Trip;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "USLUGI_PRZEWODNICKIE")
@Inheritance
@DiscriminatorColumn(name = "TYP_USLUGI")
public abstract class GuideUsage implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    // NAZWA PROGRAMU - frywolny, etc.
    private String name;
    //nalewki, pierniki, etc.
    private String addition;

    //języki
    private String language;


    public GuideUsage() {
    }

    @ManyToOne
    @JoinColumn(name = "wycieczki_id")
    private Trip trip;

    @ManyToMany
    @JoinTable(
            name = "PRZEWODNICY_ZWIEDZANIA",
            joinColumns = @JoinColumn(name = "ZWIEDZANIA_ID", referencedColumnName = "ID"),
            inverseJoinColumns = @JoinColumn(name = "PRZEWODNIK_ID", referencedColumnName = "ID"))
    private List<Guide> guides;
    
    
    
    public GuideUsage(String name, String addition, String language, Trip trip, List<Guide> guides) {
        this.name = name;
        this.addition = addition;
        this.language = language;
        this.trip = trip;
        this.guides = guides;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }

    public List<Guide> getGuides() {
        return guides;
    }

    public void setGuides(List<Guide> guides) {
        this.guides = guides;
    }

    public String getAddition() {
        return addition;
    }

    public void setAddition(String addition) {
        this.addition = addition;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
}
