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
import java.util.Collections;
import java.util.Optional;

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
        this.userService = userService;
    }

    @GetMapping(value = {"/admin"})
    public String admin(Model model) {
        model.addAttribute("admin", userService.findAll());
        return "admin/users/adminUsers";

    }

    @RequestMapping("/userConfirmDelete")
    public String userConfirmDelete() {
        return "admin/users/userConfirmDelete";
    }

    @GetMapping(value = {"/userDelete/{id}"})
    public String userDelete(@PathVariable long id) {
        userService.delete(id);
        return "redirect:/admin";
    }


    @GetMapping(value = {"/userEdit/{id}"})
    public String userEditForm(@PathVariable long id, Model model) {
        model.addAttribute("userEdit", userRepository.findById(id));
        return "admin/users/userEdit";
    }

    @PostMapping(value = {"userEdit/{id}"})
    public String userEditSave(@Valid User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        userService.saveUser(user);
        return "redirect:/admin";
    }
    @GetMapping(value = {"/userDetails/{id}"})
    public String userDetails(@PathVariable long id, Model model) {
        Optional<User> user = userRepository.findById(id);

        model.addAttribute("userDetails", user.get());
        return "admin/users/userDetails";
    }

}
