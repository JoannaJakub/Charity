package pl.coderslab.charity;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import pl.coderslab.charity.service.UserService;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;

import javax.validation.Valid;
import java.util.List;


@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final UserService userService;


    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                          CategoryRepository categoryRepository, UserRepository userRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.userService =  userService;
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

    @GetMapping("/form")
    public String formAction(Model model) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institution", institutionRepository.findAll());
        return "form";
    }

    @RequestMapping(value = "/formConfirmation", method = RequestMethod.POST)
    public String formConfirmationAction(@Valid Donation donation, BindingResult result) {

        if (result.hasErrors()) {
            return "form";
        }
        donationRepository.save(donation);
        return "form-confirmation";
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
    public String login(){
            return "login";

    }


}


