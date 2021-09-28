package pl.coderslab.charity.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.ContactCategory;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.ContactCategoryRepository;
import pl.coderslab.charity.repository.ContactRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller

public class ContactCategoryController {
    private final ContactRepository contactRepository;
    private final UserRepository userRepository;
    private final ContactCategoryRepository contactCategoryRepository;
    private final UserService userService;


    public ContactCategoryController(ContactRepository contactRepository, UserRepository userRepository, ContactCategoryRepository contactCategoryRepository, UserService userService) {
        this.contactRepository = contactRepository;
        this.userRepository = userRepository;
        this.contactCategoryRepository = contactCategoryRepository;
        this.userService = userService;
    }

    @GetMapping("/contactCategoryAdd")
    public String contactCategoryAdd(Model model) {
        model.addAttribute("contactCategory", new ContactCategory());
        return "admin/contactCategory/contactCategoryAdd";
    }

    @PostMapping(value = "/contactCategoryAddSuccess")
    public String contactCategoryAddConfirmationAction(@Valid ContactCategory contactCategory, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/contactCategory/contactCategoryAdd";
        } else {
            contactCategoryRepository.save(contactCategory);
            return "admin/contactCategory/contactCategoryAddSuccess";
        }
    }
    @RequestMapping("/contactCategoryConfirmDelete")
    public String userConfirmContactCategoryDelete() {
        return "admin/contactCategory/contactCategoryConfirmDelete";
    }

    @GetMapping(value = {"/contactCategoryDelete/{id}"})
    public String userContactCategoryDelete(@PathVariable long id) {
        contactCategoryRepository.deleteById(id);
        return "redirect:/adminContact#contactCategoryList";
    }

    @GetMapping(value = {"/contactCategoryEdit/{id}"})
    public String contactCategoryEditForm(@PathVariable long id, Model model) {
        Optional<ContactCategory> contactCategory = contactCategoryRepository.findById(id);
        if (contactCategory.isPresent()) {
            model.addAttribute("contactCategoryName", contactCategory.get());
        }else{ return "admin/adminError";}
        model.addAttribute("contactCategoryName", contactCategoryRepository.findById(id));
        return "admin/contactCategory/contactCategoryEdit";
    }

    @PostMapping(value = {"contactCategoryEdit/{id}"})
    public String contactCategoryEditSave(@Valid ContactCategory contactCategory, BindingResult result) {
        if (result.hasErrors()) {
            return "redirect:/contactCategoryEdit/{id}";
        }
        contactCategoryRepository.save(contactCategory);
        return "redirect:/adminContact#contactCategoryList";
    }
}
