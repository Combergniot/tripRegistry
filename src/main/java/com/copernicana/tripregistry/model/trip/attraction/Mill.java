package com.copernicana.tripregistry.model.trip.attraction;

import com.copernicana.tripregistry.model.trip.Trip;
import com.copernicana.tripregistry.model.trip.Trip;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import java.util.Date;

@Entity
@DiscriminatorValue("mlyny") //<Młyny wiedzy
public class Mill extends Attraction {

    public Mill(long id, Date date, String hourFrom, String hourTo, String name, Trip trip, String remarks) {
        super(id, date, hourFrom, hourTo, name, trip, remarks);
    }

    public Mill() {
    }
}
