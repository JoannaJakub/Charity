package pl.coderslab.charity.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.*;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller

public class ContactController {
    private final UserRepository userRepository;
    private final UserService userService;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final ContactRepository contactRepository;


    public ContactController(UserRepository userRepository, UserService userService,
                             DonationRepository donationRepository, CategoryRepository categoryRepository, InstitutionRepository institutionRepository, ContactRepository contactRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.contactRepository = contactRepository;
    }


    @GetMapping(value = {"/adminContact"})
    public String adminContact(Model model) {
        model.addAttribute("adminContact", contactRepository.findAll());
        return "admin/contact/adminContact";

    }
    @RequestMapping("/contactConfirmDelete")
    public String userConfirmDelete() {
        return "admin/contact/contactConfirmDelete";
    }

    @GetMapping(value = {"/contactDelete/{id}"})
    public String userDelete(@PathVariable long id) {
        contactRepository.deleteById(id);
        return "redirect:/adminContact";
    }
    @GetMapping(value = {"/contactEdit/{id}"})
    public String contactEditForm(@PathVariable long id, Model model) {
        Optional<Contact> contact = contactRepository.findById(id);

        model.addAttribute("contactEdit", contact.get());


       model.addAttribute("contactEdit2", contactRepository.findById(id));
        return "admin/contact/contactEdit";
    }

    @PostMapping(value = {"contactEdit/{id}"})
    public String contactEditSave(@Valid Contact contact, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/contact/contactEdit";
        }
        contactRepository.save(contact);
        return "redirect:/adminContact";
    }

}
