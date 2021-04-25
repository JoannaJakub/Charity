package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.repository.CategoryRepository;


import javax.validation.Valid;
import java.util.Optional;

@Controller
public class CategoryController {
    private final CategoryRepository categoryRepository;


    public CategoryController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping(value = {"/adminCategory"})
    public String adminCategory(Model model) {
        model.addAttribute("adminCategory", categoryRepository.findAll());
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
        return "redirect:/adminCategory";
    }

}
