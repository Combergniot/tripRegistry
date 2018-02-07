package com.copernicana.tripregistry;


import com.copernicana.tripregistry.model.user.Role;
import com.copernicana.tripregistry.model.user.RoleRepository;
import com.copernicana.tripregistry.model.user.User;
import com.copernicana.tripregistry.model.user.UserRepository;
import com.google.common.collect.Sets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class ApkaKopernikanyApplication implements CommandLineRunner {

    //   @Autowired
    // private MainService mainService;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;


    public static void main(String[] args) {
        SpringApplication.run(ApkaKopernikanyApplication.class, args);

    }

    @Override
    public void run(String... strings) throws Exception {


//        userRepository.save(new User("admin", bCryptPasswordEncoder.encode("admin"),
//                Sets.newHashSet(adminRole)));
        if (userRepository.findByUsername("copernicana") == null) {
            Role userRole = roleRepository.save(new Role("USER"));
            userRepository.save(new User("copernicana", bCryptPasswordEncoder.encode("copernicana"),
                    Sets.newHashSet(userRole)));
        }


        System.out.println(userRepository.findByUsername("copernicana"));
//        System.out.println(roleRepository.findRolesByUsername("admin"));


        //  addFakeData.addData();

    }
}
