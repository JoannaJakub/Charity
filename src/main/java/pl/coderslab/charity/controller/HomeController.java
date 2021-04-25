package pl.coderslab.charity.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;

import javax.validation.Valid;
import java.util.List;


@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final UserRepository userRepository;


    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                          UserRepository userRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.userRepository = userRepository;
    }


    @RequestMapping("/")
    public String homeAction(Model model, Donation donation) {
        List<Institution> institution = institutionRepository.findAll();
        model.addAttribute("institution", institution);
        Integer quantity = donationRepository.sumOfDonationQuantity();
        model.addAttribute("quantity", quantity);
        int id = donationRepository.countAllById();
        model.addAttribute("id", id);
        return "index";
    }


    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "/register_success", method = RequestMethod.POST)
    public String processRegister(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "register";
        } else if (userRepository.findByEmail(user.getEmail().toLowerCase()) != null) {
            result.addError(new FieldError(user.toString(), "email", "Podany email znajduje się w naszej bazie danych"));
        } else {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String encodedPassword = passwordEncoder.encode(user.getPassword());
            user.setPassword(encodedPassword);

            userRepository.save(user);
            return "register_success";
        }
        return "register";

    }


    @GetMapping(value = {"/login"})
    public String login() {
        return "login";

    }


}


