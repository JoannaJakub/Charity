package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final UserService userService;


    public DonationController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                           CategoryRepository categoryRepository, UserRepository userRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.userService =  userService;
    }
    @GetMapping(value = {"/adminDonation"})
    public String adminDonation(Model model){
        model.addAttribute("adminDonation", donationRepository.findAll());
        return "admin/adminDonation";

    }
    @GetMapping(value = {"/donationDelete/{id}"})
    public String donationDelete(@PathVariable long id){
        donationRepository.deleteById(id);
        return "redirect:/adminDonation";
    }

    @GetMapping(value = {"/donationEdit/{id}"})
    public String donationEditForm(@PathVariable long id, Model model){
        model.addAttribute("donationEdit", donationRepository.findById(id));
        return "admin/donationEdit";
    }

    @PostMapping(value = {"donationEdit/{id}"})
    public String donationEditSave(@Valid Donation donation, BindingResult result){
        if(result.hasErrors()){
            return "donationEdit";
        }
        donationRepository.save(donation);
        return "redirect:/adminDonation";
    }

    @GetMapping(value = {"/donationDetails/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Donation> donation = donationRepository.findById(id);

        model.addAttribute("donationDetails", donation.get());
        return "admin/donationDetails";
    }

}