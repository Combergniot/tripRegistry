
package com.copernicana.tripregistry.repository;

import com.copernicana.tripregistry.model.trip.guideusage.GuideUsage;
import org.springframework.data.repository.CrudRepository;


public interface GuideUsageRepository extends CrudRepository <GuideUsage, Long> {
    
}
