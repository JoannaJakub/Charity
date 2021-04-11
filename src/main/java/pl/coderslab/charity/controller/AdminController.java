package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

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


    @GetMapping(value = {"/userDelete/{id}"})
    public String userDelete(@PathVariable long id){
     userService.delete(id);
        return "redirect:/admin";
    }
    @PostMapping(value = {"userEdit"})
    public String userEdit(@Valid @ModelAttribute("admin") User user, BindingResult result){
        userService.saveUser(user);
        return "redirect:/admin/";
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
