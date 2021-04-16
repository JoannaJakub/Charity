package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

@Controller
public class InstitutionController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final UserService userService;


    public InstitutionController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                              CategoryRepository categoryRepository, UserRepository userRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.userService =  userService;
    }
    @GetMapping(value = {"/adminInstitution"})
    public String adminInstitution(Model model){
        model.addAttribute("adminInstitution", institutionRepository.findAll());
        return "admin/adminInstitution";

    }
    @GetMapping(value = {"/institutionDelete/{id}"})
    public String institutionDelete(@PathVariable long id){
        institutionRepository.deleteById(id);
        return "redirect:/adminInstitution";
    }

    @GetMapping(value = {"/institutionEdit/{id}"})
    public String institutionEditForm(@PathVariable long id, Model model){
        model.addAttribute("institutionEdit", institutionRepository.findById(id));
        return "admin/institutionEdit";
    }

    @PostMapping(value = {"institutionEdit/{id}"})
    public String institutionEditSave(@Valid Institution institution, BindingResult result){
        if(result.hasErrors()){
            return "institutionEdit";
        }
        institutionRepository.save(institution);
        return "redirect:/adminInstitution";
    }

}
