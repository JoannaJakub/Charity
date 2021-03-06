package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class HomeController {
    @Autowired
    InstitutionRepository institutionRepository;
    @Autowired
    DonationRepository donationRepository;
    @Autowired
    CategoryRepository categoryRepository;


    @RequestMapping("/")
    public String homeAction(Model model){
        List<Institution> institution = institutionRepository.findAll();
        model.addAttribute("institution", institution);
        int quantity = donationRepository.sumOfDonationQuantity();
        model.addAttribute("quantity", quantity);
        int id = donationRepository.numberOfDonationId();
        model.addAttribute("id", id);
        return "index";
    }

    @GetMapping("/form")
    public String formAction(Model model){
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll() );
        return "form";
    }

    @RequestMapping(value = "/formConfirmation", method = RequestMethod.POST)
    public String formConfirmationAction(@Valid Donation donation, BindingResult result){
        if(result.hasErrors()){
            return "form";
        }
        donationRepository.save(donation);
        return "form-confirmation";
    }



    @RequestMapping("/login")
    public String loginAction(Model model){  return "login";}

    @RequestMapping("/register")
    public String registerAction(Model model){  return "register";}
    }

