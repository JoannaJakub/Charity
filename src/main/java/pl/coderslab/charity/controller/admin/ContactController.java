package pl.coderslab.charity.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.*;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller

public class ContactController {
    private final ContactRepository contactRepository;
    private final UserService userService;
    private final UserRepository userRepository;


    public ContactController(ContactRepository contactRepository, UserService userService, UserRepository userRepository) {
        this.contactRepository = contactRepository;
        this.userService = userService;
        this.userRepository = userRepository;
    }

    @GetMapping(value = {"/adminContact"})
    public String adminContact(Model model) {
        model.addAttribute("adminContact", contactRepository.findAll());
        return "admin/contact/adminContact";
    }

    @GetMapping(value = {"/oneUserContacts/{id}"})
    public String oneUserContacts(@PathVariable long id, Model model) {
        List<Contact> oneUserContact = contactRepository.findContactByUserId(id);
        model.addAttribute("oneUserContacts", oneUserContact);
        Optional<User> user = userRepository.findById(id);
        model.addAttribute("userContactDetails", user.get());
        return "admin/contact/oneUserContacts";
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

    @GetMapping(value = {"/contactDetails/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Contact> contact = contactRepository.findById(id);
        model.addAttribute("contactDetails", contact.get());
        return "admin/contact/contactDetails";
    }


    @GetMapping(value = {"/contactReplay/{id}"})
    public String contactReplay(@PathVariable long id, Model model) {
        Optional<Contact> contact = contactRepository.findById(id);
        model.addAttribute("contactReplay", contact.get());
        model.addAttribute("contactEdit2", contactRepository.findById(id));
        return "admin/contact/contactReplay";
    }

    @PostMapping(value = {"contactReplay/{id}"})
    public String contactReplaySave(@Valid Contact contact, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/contact/contactReplay";
        }
        contactRepository.save(contact);
        return "redirect:/adminContact";
    }
}
