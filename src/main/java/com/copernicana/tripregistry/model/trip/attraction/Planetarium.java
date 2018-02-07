
package com.copernicana.tripregistry.model.trip.attraction;

import com.copernicana.tripregistry.model.trip.Trip;
import java.util.Date;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("planetarium")
public class Planetarium extends Attraction {

    public Planetarium(long id, Date date, String hourFrom, String hourTo, String name, Trip trip, String remarks) {
        super(id, date, hourFrom, hourTo, name, trip, remarks);
    }

    public Planetarium() {
    }
}
