package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.validation.Valid;
import java.util.List;


@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository, CategoryRepository categoryRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
    }


    @RequestMapping("/")
    public String homeAction(Model model, Donation donation){
        List<Institution> institution = institutionRepository.findAll();
        model.addAttribute("institution", institution);
        long quantity = donationRepository.sumOfDonationQuantity();
        model.addAttribute("quantity", quantity);
        long id = donationRepository.countAllById();
        model.addAttribute("id", id);
        return "index";
    }

    @GetMapping("/form")
    public String formAction(Model model){
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll() );
        List<Institution> institution = institutionRepository.findAll();
        model.addAttribute("institution", institution);
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

