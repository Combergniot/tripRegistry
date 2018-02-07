package com.copernicana.tripregistry.repository;

import com.copernicana.tripregistry.model.trip.Guide;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GuideRepository extends CrudRepository <Guide, Long> {

}
