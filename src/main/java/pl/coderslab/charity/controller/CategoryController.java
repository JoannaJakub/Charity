package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class CategoryController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final UserService userService;


    public CategoryController(InstitutionRepository institutionRepository, DonationRepository donationRepository,
                              CategoryRepository categoryRepository, UserRepository userRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.userService =  userService;
    }

    @GetMapping(value = {"/adminCategory"})
    public String adminCategory(Model model){
        model.addAttribute("adminCategory", categoryRepository.findAll());
        return "admin/adminCategory";
    }
    @GetMapping(value = {"/categoryDelete/{id}"})
    public String categoryDelete(@PathVariable long id){
        categoryRepository.deleteById(id);
        return "redirect:/adminCategory";
    }
    @GetMapping(value = {"/categoryEdit/{id}"})
    public String categoryEditForm(@PathVariable long id, Model model){
        model.addAttribute("categoryEdit", categoryRepository.findById(id));
        return "admin/categoryEdit";
    }

    @PostMapping(value = {"categoryEdit/{id}"})
    public String categoryEditSave(@Valid Category category, BindingResult result){
        if(result.hasErrors()){
            return "categoryEdit";
        }
        categoryRepository.save(category);
        return "redirect:/adminCategory";
    }
}
