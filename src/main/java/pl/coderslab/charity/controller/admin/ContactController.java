package pl.coderslab.charity.controller.admin;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.ContactCategory;
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
    private final ContactCategoryRepository contactCategoryRepository;


    public ContactController(ContactRepository contactRepository, UserService userService, UserRepository userRepository, ContactCategoryRepository contactCategoryRepository) {
        this.contactRepository = contactRepository;
        this.userService = userService;
        this.userRepository = userRepository;
        this.contactCategoryRepository = contactCategoryRepository;
    }

    @GetMapping(value = {"/adminContact"})
    public String adminContact(Model model) {
        model.addAttribute("adminContact", contactRepository.findAll());
        model.addAttribute("contactsUsers", contactRepository.findAll());
        model.addAttribute("adminContactq", contactRepository.findAll());
        model.addAttribute("contactCategoryList", contactCategoryRepository.findAll());
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
    @GetMapping("/contactCategoryAdd")
    public String contactCategoryAdd(Model model) {
        model.addAttribute("contactCategoryAdd", new ContactCategory());
        return "admin/contact/contactCategoryAdd";
    }

    @RequestMapping(value = "/contactCategoryAddSuccess", method = RequestMethod.POST)
    public String contactCategoryAddConfirmationAction(@Valid ContactCategory contactCategory, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/contact/contactCategoryAdd";
        }
        contactCategoryRepository.save(contactCategory);
        return "admin/contact/contactCategoryAddSuccess";
    }
    @GetMapping(value = {"/contactByCategory/{id}"})
    public String contactByCategory(@PathVariable long id, Model model) {
        List<Contact> contact = contactRepository.findByContactCategoryId(id);
        model.addAttribute("contactByCategory", contact);
        return "admin/contact/contactByCategory";
    }
    @GetMapping("/contactAddAdmin")
    public String contactAdd(Model model, Authentication authentication) {
        model.addAttribute("contactAdd", new Contact());
      //  model.addAttribute("user", userService.findByEmail(authentication.getName()));
        model.addAttribute("contactCategory", contactCategoryRepository.findAll());

        return "admin/contact/contactAdd";
    }

    @RequestMapping(value = "/contactAddSuccessAdmin", method = RequestMethod.POST)
    private String contactAddConfirmationAction(@Valid Contact contact, BindingResult result) {

        if (result.hasErrors()) {
            return "admin/contact/contactAdd";
        }
        contactRepository.save(contact);
        return "admin/contact/contactAddSuccess";
    }


}
