package com.copernicana.tripregistry.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class LoginController {

    @GetMapping("/public")
    public String publicPage(HttpServletRequest request) {
        System.out.println("Inside publicPage method!");
        System.out.println(request.getRequestURL()+"?"+request.getQueryString());
        return "welcome";
    }






}
