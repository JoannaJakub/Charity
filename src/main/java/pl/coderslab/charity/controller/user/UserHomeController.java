package pl.coderslab.charity.controller.user;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

@Controller
public class UserHomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final UserService userService;


    public UserHomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                              CategoryRepository categoryRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.userService = userService;
    }

    @GetMapping("/form")
    public String formAction(Model model, Authentication authentication) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institution", institutionRepository.findAll());
        model.addAttribute("user", userService.findByEmail(authentication.getName()));
        return "user/donations/form";
    }

    @RequestMapping(value = "/formConfirmation", method = RequestMethod.POST)
    public String formConfirmationAction(@Valid Donation donation, BindingResult result) {

        if (result.hasErrors()) {
            return "user/donations/form";
        }
        donationRepository.save(donation);
        return "user/donations/formConfirmation";
    }
}
