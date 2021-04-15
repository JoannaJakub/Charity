package pl.coderslab.charity.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
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

    @PostMapping(value = {"userEdit/{id}"})
    public String userEditSave(@Valid User user){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        userService.saveUser(user);
        return "redirect:/admin";
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

    @GetMapping(value = {"/donationEdit/{id}"})
    public String donationEditForm(@PathVariable long id, Model model){
        model.addAttribute("donationEdit", donationRepository.findById(id));
        return "admin/donationEdit";
    }

    @PostMapping(value = {"donationEdit/{id}"})
    public String donationEditSave(@Valid Donation donation, BindingResult result){
        if(result.hasErrors()){
            return "donationEdit";
        }
        donationRepository.save(donation);
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

    @GetMapping(value = {"/institutionEdit/{id}"})
    public String institutionEditForm(@PathVariable long id, Model model){
        model.addAttribute("institutionEdit", institutionRepository.findById(id));
        return "admin/institutionEdit";
    }

    @PostMapping(value = {"institutionEdit/{id}"})
    public String institutionEditSave(@Valid Institution institution, BindingResult result){
        if(result.hasErrors()){
            return "institutionEdit";
        }
        institutionRepository.save(institution);
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
    @GetMapping(value = {"/categoryEdit/{id}"})
    public String categoryEditForm(@PathVariable long id, Model model){
        model.addAttribute("categoryEdit", categoryRepository.findById(id));
        return "admin/categoryEdit";
    }

    @PostMapping(value = {"categoryEdit/{id}"})
    public String categoryEditSave(@Valid Category category, BindingResult result){
        if(result.hasErrors()){
            return "categoryEdit";
        }
        categoryRepository.save(category);
        return "redirect:/adminCategory";
    }
}
