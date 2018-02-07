
package com.copernicana.tripregistry.model.trip.guideusage;

import com.copernicana.tripregistry.model.trip.Guide;
import com.copernicana.tripregistry.model.trip.Trip;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@DiscriminatorValue("zwiedzanie")
public class Sightseeing extends GuideUsage {

    @Temporal(TemporalType.DATE)
    private Date date;

    private String hourFrom;
    private String hourTo;

    private boolean gingerbread;
    private boolean nalewki;
    private boolean meetingWithExecutioner;
    private boolean meetingWithCopernicus;

    private boolean pilotage;

    @Lob
    private String remarks;

    public Sightseeing(String name, String addition,
                       String language, Trip trip, List<Guide> guides,
                       Date date, String hourFrom, String hourTo,
                       boolean gingerbread, boolean nalewki, boolean meetingWithExecutioner,
                       boolean meetingWithCopernicus, boolean pilotage, String remarks) {
        super(name, addition, language, trip, guides);
        this.date = date;
        this.hourFrom = hourFrom;
        this.hourTo = hourTo;
        this.gingerbread = gingerbread;
        this.nalewki = nalewki;
        this.meetingWithExecutioner = meetingWithExecutioner;
        this.meetingWithCopernicus = meetingWithCopernicus;
        this.pilotage = pilotage;
        this.remarks = remarks;
    }

    public Sightseeing() {
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


    public boolean isGingerbread() {
        return gingerbread;
    }

    public void setGingerbread(boolean gingerbread) {
        this.gingerbread = gingerbread;
    }

    public boolean isNalewki() {
        return nalewki;
    }

    public void setNalewki(boolean nalewki) {
        this.nalewki = nalewki;
    }

    public boolean isMeetingWithExecutioner() {
        return meetingWithExecutioner;
    }

    public void setMeetingWithExecutioner(boolean meetingWithExecutioner) {
        this.meetingWithExecutioner = meetingWithExecutioner;
    }

    public boolean isMeetingWithCopernicus() {
        return meetingWithCopernicus;
    }

    public void setMeetingWithCopernicus(boolean meetingWithCopernicus) {
        this.meetingWithCopernicus = meetingWithCopernicus;
    }

    public boolean isPilotage() {
        return pilotage;
    }

    public void setPilotage(boolean pilotage) {
        this.pilotage = pilotage;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }



}
