package pl.coderslab.charity.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.*;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller

public class AdminController {
    private final UserRepository userRepository;
    private final UserService userService;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final ContactRepository contactRepository;


    public AdminController(UserRepository userRepository, UserService userService,
                           DonationRepository donationRepository, CategoryRepository categoryRepository, InstitutionRepository institutionRepository, ContactRepository contactRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.contactRepository = contactRepository;
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
        return "redirect:/userConfirmEditing/{id}";
    }
    @RequestMapping("/userConfirmEditing/{id}")
    public String userConfirmEditing(@PathVariable long id, Model model) {
        Optional<User> user = userRepository.findById(id);
        model.addAttribute("userConfirmEdit", user.get());
        return "admin/users/userConfirmEdit";
    }

    @GetMapping(value = {"/userDetails/{id}"})
    public String userDetails(@PathVariable long id, Model model) {
        Optional<User> user = userRepository.findById(id);
        model.addAttribute("userDetails", user.get());
        return "admin/users/userDetails";
    }

    @GetMapping(value = {"/oneUserDonations/{id}"})
    public String donationEditForm(@PathVariable long id, Model model) {
        List<Donation> oneUserDonations = donationRepository.findDonationByUserId(id);
        model.addAttribute("oneUserDonations", oneUserDonations);
        return "admin/users/oneUserDonations";
    }
    @GetMapping("/adminForm")
    public String formAction(Model model) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institution", institutionRepository.findAll());
        return "admin/donations/adminForm";
    }

    @RequestMapping(value = "/adminFormConfirmation", method = RequestMethod.POST)
    public String formConfirmationAction(@Valid Donation donation, BindingResult result) {

        if (result.hasErrors()) {
            return "adminForm";
        }
        donationRepository.save(donation);
        return "admin/donations/adminFormConfirmation";
    }

}
