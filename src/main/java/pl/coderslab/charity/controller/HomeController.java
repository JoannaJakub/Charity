package pl.coderslab.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import pl.coderslab.charity.model.*;
import pl.coderslab.charity.repository.*;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;


@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final UserRepository userRepository;
    private final ContactRepository contactRepository;
    private final UserService userService;
    private final CategoryRepository categoryRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                          UserRepository userRepository, ContactRepository contactRepository, UserService userService, CategoryRepository categoryRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.userRepository = userRepository;
        this.contactRepository = contactRepository;
        this.userService = userService;
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/")
    public String homeAction(Model model) {
        List<Institution> institution = institutionRepository.findAll();
        model.addAttribute("institution", institution);
        Integer quantity = donationRepository.sumOfDonationQuantity();
        model.addAttribute("quantity", quantity);
        int id = donationRepository.countAllById();
        model.addAttribute("id", id);
        return "main/index";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "main/register";
    }

    @PostMapping(value = "/register_success")
    public String processRegister(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "register";
        } else if (userRepository.findByEmail(user.getEmail().toLowerCase()) != null) {
            result.addError(new FieldError(user.toString(), "email", "Podany email znajduje się w naszej bazie danych"));
        }else if(!(user.getPassword().equals(user.getRetypePassword()))){
            result.addError(new FieldError(user.toString(), "retypePassword", "Passwords dont match"));
        } else {
       /*     BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String encodedPassword = passwordEncoder.encode(user.getPassword());
            user.setPassword(encodedPassword);*/
            userService.saveUser(user);
            return "main/register_success";
        }
        return "register";
    }

    @GetMapping(value = {"/login"})
    public String login() {
        return "main/login";
    }

    @GetMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("contact", new Contact());
        return "footer";
    }

    @PostMapping (value = "/contactAddSuccess")
    public String contactConfirmationAction(@Valid Contact contact, BindingResult result) {
        if (result.hasErrors()) {
            return "index";
        }
        contactRepository.save(contact);
        return "main/contactAddSuccess";
    }
    @GetMapping(value= {"/default"})
    public String defaultAfterLogin() {
        Collection<? extends GrantedAuthority> authorities;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        authorities = auth.getAuthorities();
        String myRole = authorities.toArray()[0].toString();
        String admin = "ADMIN";
        if (myRole.equals(admin)) {
            return "redirect:/admin";
        }
        return "redirect:/userForm";
    }
    @GetMapping("/form")
    public String formAction(Model model, Authentication authentication) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institution", institutionRepository.findAll());
        model.addAttribute("user", userService.findByEmail(authentication.getName()));
        return "main/form";
    }

    @PostMapping(value = "/formConfirmation")
    public String formConfirmationAction(@Valid Donation donation, BindingResult result) {

        if (result.hasErrors()) {
            return "main/form";
        }
        donationRepository.save(donation);
        return "main/formConfirmation";
    }
}


