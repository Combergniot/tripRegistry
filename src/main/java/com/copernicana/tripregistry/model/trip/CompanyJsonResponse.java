
package com.copernicana.tripregistry.model.trip;

import java.util.Map;


public class CompanyJsonResponse {
    
    private Company company;
    private boolean validated;
   private Map<String, String> errorMessages;

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public boolean isValidated() {
        return validated;
    }

    public void setValidated(boolean validated) {
        this.validated = validated;
    }

    public Map<String, String> getErrorMessages() {
        return errorMessages;
    }

    public void setErrorMessages(Map<String, String> errorMessages) {
        this.errorMessages = errorMessages;
    }
   
   

    
}
