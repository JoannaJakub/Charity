package pl.coderslab.charity.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;


import javax.validation.Valid;
import java.util.Optional;

@Controller
public class CategoryController {
    private final CategoryRepository categoryRepository;
    private final DonationRepository donationRepository;

    public CategoryController(CategoryRepository categoryRepository, DonationRepository donationRepository) {
        this.categoryRepository = categoryRepository;
        this.donationRepository = donationRepository;
    }

    @GetMapping(value = {"/adminCategory"})
    public String adminCategory(Model model) {
        model.addAttribute("adminCategory", categoryRepository.findAll());
        model.addAttribute("categoryDonations", donationRepository.findAll());
        System.out.println(donationRepository.findAll());
        model.addAttribute("categoryInstitutions", donationRepository.findAll());
        return "admin/categories/adminCategory";
    }

    @RequestMapping("/categoryConfirmDelete")
    public String categoryConfirmDelete() {
        return "admin/categories/categoryConfirmDelete";
    }

    @GetMapping(value = {"/categoryDelete/{id}"})
    public String categoryDelete(@PathVariable long id) {
        categoryRepository.deleteById(id);
        return "redirect:/adminCategory";
    }

    @GetMapping(value = {"/categoryEdit/{id}"})
    public String categoryEditForm(@PathVariable long id, Model model) {
        model.addAttribute("categoryEdit", categoryRepository.findById(id));
        return "admin/categories/categoryEdit";
    }

    @PostMapping(value = {"categoryEdit/{id}"})
    public String categoryEditSave(@Valid Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "categoryEdit";
        }
        categoryRepository.save(category);
        return "redirect:/adminCategory";
    }

    @GetMapping(value = {"/categoryDetails/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Category> category = categoryRepository.findById(id);
        model.addAttribute("categoryDetails", category.get());
        model.addAttribute("oneCategoryDonations", donationRepository.findDonationByCategoryId(id));
        return "admin/categories/categoryDetails";
    }

    @GetMapping("/categoryAdd")
    public String formAction(Model model) {
        model.addAttribute("categoryAdd", new Category());
        return "admin/categories/categoryAdd";
    }

    @RequestMapping(value = "/categoryAddSuccess", method = RequestMethod.POST)
    public String formConfirmationAction(@Valid Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/categories/categoryAdd";
        }
        categoryRepository.save(category);
        return "admin/categories/categoryAddSuccess";
    }
}
