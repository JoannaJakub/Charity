package pl.coderslab.charity.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.Optional;

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
        this.userService = userService;
    }

    @GetMapping(value = {"/adminInstitution"})
    public String adminInstitution(Model model) {
        model.addAttribute("adminInstitution", institutionRepository.findAll());
        return "admin/adminInstitution";

    }

    @GetMapping(value = {"/institutionDelete/{id}"})
    public String institutionDelete(@PathVariable long id) {
        institutionRepository.deleteById(id);
        return "redirect:/adminInstitution";
    }

    @GetMapping(value = {"/institutionEdit/{id}"})
    public String institutionEditForm(@PathVariable long id, Model model) {
        model.addAttribute("institutionEdit", institutionRepository.findById(id));
        return "admin/institutionEdit";
    }

    @PostMapping(value = {"institutionEdit/{id}"})
    public String institutionEditSave(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "institutionEdit";
        }
        institutionRepository.save(institution);
        return "redirect:/adminInstitution";
    }

    @GetMapping(value = {"/institutionDetails/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Institution> institution = institutionRepository.findById(id);

        model.addAttribute("institutionDetails", institution.get());
        return "admin/institutionDetails";
    }

    @GetMapping("/institutionAdd")
    public String institutionAddForm(Model model) {
        model.addAttribute("institutionAdd", new Institution());
        return "admin/institutionAdd";
    }

    @RequestMapping(value = "/institutionAddSuccess", method = RequestMethod.POST)
    public String institutionAddSuccess(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/institutionAdd";
        }
        institutionRepository.save(institution);
        return "admin/institutionAddSuccess";

    }
}
