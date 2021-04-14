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
    @GetMapping(value = {"/userEdit/{id}"})
    public String userEditForm(@PathVariable long id, Model model){
       model.addAttribute("userEdit", userRepository.findById(id));
        return "admin/userEdit";
    }

    @PostMapping(value = {"userEdit"})
    public String userEditSave(@Valid User user, BindingResult result){
        userService.saveUser(user);
        return "redirect:/admin/admin";
    }


    @GetMapping(value = {"/adminDonation"})
    public String adminDonation(Model model){
        model.addAttribute("adminDonation", donationRepository.findAll());
        return "admin/adminDonation";

    }
    @GetMapping(value = {"/donationDelete/{id}"})
    public String donationDelete(@PathVariable long id){
        donationRepository.deleteById(id);
        return "redirect:/adminDonation";
    }

    @GetMapping(value = {"/adminInstitution"})
    public String adminInstitution(Model model){
        model.addAttribute("adminInstitution", institutionRepository.findAll());
        return "admin/adminInstitution";

    }
    @GetMapping(value = {"/institutionDelete/{id}"})
    public String institutionDelete(@PathVariable long id){
        institutionRepository.deleteById(id);
        return "redirect:/adminInstitution";
    }
    @GetMapping(value = {"/adminCategory"})
    public String adminCategory(Model model){
        model.addAttribute("adminCategory", categoryRepository.findAll());
        return "admin/adminCategory";
    }
    @GetMapping(value = {"/categoryDelete/{id}"})
    public String categoryDelete(@PathVariable long id){
        categoryRepository.deleteById(id);
        return "redirect:/adminCategory";
    }
}
