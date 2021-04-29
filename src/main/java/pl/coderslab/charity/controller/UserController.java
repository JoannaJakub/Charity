package pl.coderslab.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.util.Optional;

@Controller
public class UserController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final UserService userService;


    public UserController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                          CategoryRepository categoryRepository, UserRepository userRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @GetMapping("/form")
    public String formAction(Model model, Authentication authentication) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institution", institutionRepository.findAll());
        model.addAttribute("user", userService.findByEmail(authentication.getName()));
        return "user/form";
    }

    @RequestMapping(value = "/formConfirmation", method = RequestMethod.POST)
    public String formConfirmationAction(@Valid Donation donation, BindingResult result) {

        if (result.hasErrors()) {
            return "form";
        }
        donationRepository.save(donation);
        return "user/formConfirmation";
    }


    @GetMapping(value = {"/ownDonation"})
    public String admin(Model model) {
        // model.addAttribute("ownDonation", userService.findById(id));
        model.addAttribute("ownDonation", donationRepository.findAll());
        return "user/ownDonation";

    }

    @GetMapping(value = {"/userPersonalDetails"})
    public String userPersonalDetails(@PathVariable long id, Model model, Authentication authentication) {
        //   Optional<User> user = userRepository.findById(id);
        //  model.addAttribute("user", userService.findByEmail(authentication.getName()));
        model.addAttribute("user", userService.findByEmail(authentication.getName()));

        model.addAttribute("userPersonalDetails", userService.findByEmail(authentication.getName()));
        ;
        return "user/userPersonalDetails";
    }

    @GetMapping(value = {"/contact"})
    public String contact(Model model) {

        return "user/contact";

    }

    @GetMapping("/changePassword")
    public String changePassword(Model model) {
        model.addAttribute("user", new User());
        return "user/changePassword";
    }

    @RequestMapping(value = "/changePasswordSuccess", method = RequestMethod.POST)
    public String processRegister(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "changePassword";
        } else {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String encodedPassword = passwordEncoder.encode(user.getPassword());
            user.setPassword(encodedPassword);

            userRepository.save(user);
            return "user/changePasswordSuccess";
        }

    }
}
