

package com.copernicana.tripregistry.repository;

import com.copernicana.tripregistry.model.trip.Accomodation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccommodationRepository extends CrudRepository <Accomodation, Long> {

}
