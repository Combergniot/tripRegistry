package com.copernicana.tripregistry.controller;

import com.copernicana.tripregistry.model.trip.Company;
import com.copernicana.tripregistry.model.trip.CompanyJsonResponse;
import com.copernicana.tripregistry.repository.CompanyRepository;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CompanyController {
    
    @Autowired
    private CompanyRepository companyRepository;
    
    @RequestMapping(value = "/company", method = RequestMethod.GET)
    public @ResponseBody
    List<Company> getCompanies() {
 
        List<Company> companies = new ArrayList<>();
        Iterable<Company> companiesIterable = companyRepository.findAll();
        companiesIterable.forEach(companies::add);
        
        // Recently added companies will be on top of select list
        Collections.reverse(companies);

        return companies;
    }
    
    
    
    @RequestMapping(value = "/singleCompany", method = RequestMethod.GET)
    public @ResponseBody
    Company getCompany(
    @RequestParam(value="id", required=true) Long companyId
    ) {
    
        return (Company) companyRepository.findOne(companyId);
    }

    
    @PostMapping(value = "/company/add", produces = { MediaType.APPLICATION_JSON_VALUE })
    @ResponseBody
    public CompanyJsonResponse addCompany(@ModelAttribute @Valid Company company,
         BindingResult result) {
             
        CompanyJsonResponse response = new CompanyJsonResponse();
         
        if(result.hasErrors()){


 Map<String, String> errors = new HashMap<String, String>();
 for(FieldError error : result.getFieldErrors()){
 errors.put(error.getField(), error.getDefaultMessage());
 
 }
 
            System.out.println(result.getFieldErrors());
         
         response.setValidated(false);
         response.setErrorMessages(errors);
      }else{
        
         companyRepository.save(company);
        
         response.setValidated(true);
         response.setCompany(company);
      }
 

        return response;
    }

}
