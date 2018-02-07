package com.copernicana.tripregistry.model.trip.attraction;

import com.copernicana.tripregistry.model.trip.Trip;
import java.util.Date;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("piwo")
public class Beer extends Attraction {


    public Beer(long id, Date date, String hourFrom, String hourTo, String name, Trip trip, String remarks) {
        super(id, date, hourFrom, hourTo, name, trip, remarks);
    }

    public Beer() {
    }
}
