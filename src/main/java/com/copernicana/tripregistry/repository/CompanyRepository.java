package com.copernicana.tripregistry.repository;

import com.copernicana.tripregistry.model.trip.Company;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepository<T extends Company> extends CrudRepository <T, Long> {
    
    
 
    
}
