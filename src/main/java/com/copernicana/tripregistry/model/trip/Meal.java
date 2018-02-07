package com.copernicana.tripregistry.model.trip;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="POSILKI")
public class Meal {
    
      @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
      
      @Temporal(TemporalType.DATE)
      private Date date;
      private String hourFrom;
      private String hourTo;
      private String mealType;
      private String place;
      @Lob
      private String remarks;
      
      @ManyToOne
      @JoinColumn(name="wycieczki_id")
      private Trip trip;

    public Meal(Date date, String hour, String mealType, String place, String remarks, Trip trip) {
        this.date = date;
        this.mealType = mealType;
        this.place = place;
        this.remarks = remarks;
        this.trip = trip;
    }



    public Meal() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getHourFrom() {
        return hourFrom;
    }

    public void setHourFrom(String hourFrom) {
        this.hourFrom = hourFrom;
    }

    public String getHourTo() {
        return hourTo;
    }

    public void setHourTo(String hourTo) {
        this.hourTo = hourTo;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }



    public String getMealType() {
        return mealType;
    }

    public void setMealType(String mealType) {
        this.mealType = mealType;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }
}
