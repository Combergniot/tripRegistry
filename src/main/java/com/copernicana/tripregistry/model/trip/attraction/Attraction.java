package com.copernicana.tripregistry.model.trip.attraction;

import com.copernicana.tripregistry.model.trip.Trip;
import java.util.Date;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "ATRAKCJE")
@Inheritance
@DiscriminatorColumn(name = "TYP_ATRAKCJI")
public abstract class Attraction {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Temporal(TemporalType.DATE)
    private Date date;

    private String hourFrom;
    private String hourTo;
    
    private String name;

    @ManyToOne
    @JoinColumn(name = "wycieczki_id")
    private Trip trip;
    
    @Lob
    private String remarks;

    public Attraction(long id, Date date, String hourFrom, String hourTo, String name, Trip trip, String remarks) {
        this.id = id;
        this.date = date;
        this.hourFrom = hourFrom;
        this.hourTo = hourTo;
        this.name = name;
        this.trip = trip;
        this.remarks = remarks;
    }

    public Attraction() {
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "Attraction{" +
                "id=" + id +
                ", date=" + date +
                ", hourFrom='" + hourFrom + '\'' +
                ", hourTo='" + hourTo + '\'' +
                ", name='" + name + '\'' +
                ", trip=" + trip +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}
