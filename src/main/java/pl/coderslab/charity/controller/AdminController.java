package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

@Controller

public class AdminController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final UserService userService;


    public AdminController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                          CategoryRepository categoryRepository, UserRepository userRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.userService =  userService;
    }
    @GetMapping(value = {"/admin"})
    public String admin(Model model){
        model.addAttribute("admin", userService.findAll());
        return "admin/admin";

    }


    @GetMapping(value = {"/userDelete"})
    public String deleteUser(@RequestParam Long id, Model model){
     model.addAttribute("delete",  userRepository.deleteUserById(id));
        return "admin/admin";
    }



    @GetMapping(value = {"/adminDonation"})
    public String adminDonation(Model model){
        model.addAttribute("adminDonation", donationRepository.findAll());
        return "admin/adminDonation";

    }

    @GetMapping(value = {"/adminInstitution"})
    public String adminInstitution(Model model){
        model.addAttribute("adminInstitution", institutionRepository.findAll());
        return "admin/adminInstitution";

    }
}
