package pl.coderslab.charity.controller.user;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class UserDonationController {
    private final DonationRepository donationRepository;
    private final UserService userService;


    public UserDonationController(DonationRepository donationRepository,
                                  UserService userService) {
        this.donationRepository = donationRepository;
        this.userService = userService;
    }

    @GetMapping(value = {"/ownDonation"})
    public String admin(Model model, Authentication authentication) {
        User user = userService.findByEmail(authentication.getName());
        model.addAttribute("ownDonation", donationRepository.findDonationByUserId(user.getId()));
        return "user/donations/ownDonation";

    }

    @RequestMapping("/donationConfirmDeleteByUser")
    public String donationConfirmDeleteByUser() {
        return "user/donations/donationConfirmDeleteByUser";
    }

    @GetMapping(value = {"/donationDeleteByUser/{id}"})
    public String donationDeleteByUser(@PathVariable long id) {
        donationRepository.deleteById(id);
        return "redirect:/ownDonation";
    }

    @GetMapping(value = {"/ownDonationEdit/{id}"})
    public String ownDonationEditEditForm(@PathVariable long id, Model model, Authentication authentication) {
        model.addAttribute("ownDonationEdit", donationRepository.findById(id));
        model.addAttribute("user", userService.findByEmail(authentication.getName()));
        return "user/donations/ownDonationEdit";
    }

    @PostMapping(value = {"ownDonationEdit/{id}"})
    public String ownDonationEditEditSave(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "ownDonationEdit";
        }
        donationRepository.save(donation);
        return "redirect:/ownDonation";
    }

    @GetMapping(value = {"/ownDonationDetail/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Donation> donation = donationRepository.findById(id);
        if (donation.isPresent()) {
            model.addAttribute("ownDonationDetail", donation.get());
        }else{ return "admin/adminError";}
        return "user/donations/ownDonationDetail";
    }

}
