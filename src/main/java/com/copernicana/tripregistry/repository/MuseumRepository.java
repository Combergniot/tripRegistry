package com.copernicana.tripregistry.repository;

import com.copernicana.tripregistry.model.trip.attraction.Museum;
import org.springframework.stereotype.Repository;

@Repository
public interface MuseumRepository extends AttractionRepository<Museum> {
}
