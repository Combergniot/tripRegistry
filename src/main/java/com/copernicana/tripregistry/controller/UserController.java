package com.copernicana.tripregistry.controller;

import com.copernicana.tripregistry.model.user.Role;
import com.copernicana.tripregistry.model.user.RoleRepository;
import com.copernicana.tripregistry.model.user.User;
import com.copernicana.tripregistry.model.user.UserRepository;
import com.google.common.collect.Sets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
public class UserController {


    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("addUser")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "adduser";
    }

    @PostMapping("addUser")
    public String saveUser(@ModelAttribute("user") User user) {

        if (userRepository.findByUsername(user.getUsername()) == null) {
            Role userRole = roleRepository.save(new Role("USER"));
            userRepository.save(new User(user.getUsername(), bCryptPasswordEncoder.encode(user.getPassword()),
                    Sets.newHashSet(userRole)));
            return "redirect:/addUser?success=true";
        }

        return "redirect:/addUser?success=false";
    }


}

