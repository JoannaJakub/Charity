package pl.coderslab.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.*;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final UserService userService;
    private final ContactRepository contactRepository;




    public UserController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                          CategoryRepository categoryRepository, UserRepository userRepository, UserService userService, ContactRepository contactRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.userService = userService;
        this.contactRepository = contactRepository;
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
            return "user/form";
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
    public String userPersonalDetails(Model model, Authentication authentication) {
        model.addAttribute("userPersonalDetails", userService.findByEmail(authentication.getName()));
        return "user/userPersonalDetails";
    }


    @GetMapping(value = {"/userEditPersonalDetails"})
    public String userEditPersonalDetails(Model model, Authentication authentication) {
        model.addAttribute("userEditPersonalDetails", userService.findByEmail(authentication.getName()));
        return "user/userEditPersonalDetails";
    }
    @RequestMapping(value = "/userEditPersonalDetailsConfirmation", method = RequestMethod.POST)
    public String userEditPersonalDetailsConfirmation(@Valid User user, BindingResult result) {

        userService.saveUser(user);
        return "user/userPersonalDetails";
    }

    @GetMapping(value = {"/changePassword"})
    public String userChangePassword(@PathVariable long id, Model model) {
        model.addAttribute("changePassword", userRepository.findById(id));
        return "user/changePassword";
    }

    @PostMapping(value = {"changePassword/{id}"})
    public String userChangePasswordSave(@Valid User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        return "redirect:/form";
    }

    @GetMapping("/institutionAddByUser")
    public String institutionAddForm(Model model) {
        model.addAttribute("institutionAddByUser", new Institution());
        return "user/institutionAddByUser";
    }

    @RequestMapping(value = "/institutionAddByUserSuccess", method = RequestMethod.POST)
    public String institutionAddSuccess(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "user/institutionAddByUser";
        }
        institutionRepository.save(institution);
        return "user/institutionAddByUserSuccess";

    }

    @GetMapping("/contactAddByUser")
    public String contactAddByUser(Model model, Authentication authentication) {
        model.addAttribute("contactAddByUser", new Contact());
        model.addAttribute("user", userService.findByEmail(authentication.getName()));
        return "user/contactAddByUser";
    }
    @RequestMapping(value = "/contactAddByUserSuccess", method = RequestMethod.POST)
    private String contactAddByUserConfirmationAction(@Valid Contact contact, BindingResult result) {

        if (result.hasErrors()) {
            return "user/contactAddByUser";
        }
        contactRepository.save(contact);
        return "user/contactAddByUserSuccess";
    }
}
