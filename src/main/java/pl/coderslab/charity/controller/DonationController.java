package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class DonationController {
    private final DonationRepository donationRepository;


    public DonationController(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @GetMapping(value = {"/adminDonation"})
    public String adminDonation(Model model) {
        model.addAttribute("adminDonation", donationRepository.findAll());
        model.addAttribute("donationCategories", donationRepository.findAll());
        model.addAttribute("donationInstitutions", donationRepository.findAll());
        model.addAttribute("lastDonation", donationRepository.findTopById());
        System.out.println(donationRepository.findTopById());

        return "admin/donations/adminDonation";

    }

    @RequestMapping("/donationConfirmDelete")
    public String donationConfirmDelete() {
        return "admin/donations/donationConfirmDelete";
    }

    @GetMapping(value = {"/donationDelete/{id}"})
    public String donationDelete(@PathVariable long id) {
        donationRepository.deleteById(id);
        return "redirect:/adminDonation";
    }

    @GetMapping(value = {"/donationEdit/{id}"})
    public String donationEditForm(@PathVariable long id, Model model) {
        model.addAttribute("donationEdit", donationRepository.findById(id));
        return "admin/donations/donationEdit";
    }

    @PostMapping(value = {"donationEdit/{id}"})
    public String donationEditSave(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "donationEdit";
        }
        donationRepository.save(donation);
        return "redirect:/adminDonation";
    }

    @GetMapping(value = {"/donationDetails/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Donation> donation = donationRepository.findById(id);

        model.addAttribute("donationDetails", donation.get());
        return "admin/donations/donationDetails";
    }

}
