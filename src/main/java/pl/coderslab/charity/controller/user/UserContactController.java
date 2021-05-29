package pl.coderslab.charity.controller.user;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.ContactCategory;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.ContactCategoryRepository;
import pl.coderslab.charity.repository.ContactRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class UserContactController {
    private final UserService userService;
    private final ContactRepository contactRepository;
    private final DonationRepository donationRepository;
    private final ContactCategoryRepository contactCategoryRepository;


    public UserContactController(UserService userService, ContactRepository contactRepository, DonationRepository donationRepository, ContactCategoryRepository contactCategoryRepository) {
        this.userService = userService;
        this.contactRepository = contactRepository;
        this.donationRepository = donationRepository;
        this.contactCategoryRepository = contactCategoryRepository;
    }

    @GetMapping("/contactAddByUser")
    public String contactAddByUser(Model model, Authentication authentication) {
        model.addAttribute("contactAddByUser", new Contact());
        model.addAttribute("user", userService.findByEmail(authentication.getName()));
        model.addAttribute("contactCategory", contactCategoryRepository.findAll());

        return "user/contacts/contactAddByUser";
    }

    @RequestMapping(value = "/contactAddByUserSuccess", method = RequestMethod.POST)
    private String contactAddByUserConfirmationAction(@Valid Contact contact, BindingResult result) {

        if (result.hasErrors()) {
            return "user/contacts/contactAddByUser";
        }
        contactRepository.save(contact);
        return "user/contacts/contactAddByUserSuccess";
    }

    @GetMapping(value = {"/contactsOfUser"})
    public String contactsOfUser(Model model, Authentication authentication) {
        User user = userService.findByEmail(authentication.getName());
        model.addAttribute("contactsOfUser", contactRepository.findContactByUserId(user.getId()));
        return "user/contacts/contactsOfUser";

    }
    @RequestMapping("/contactConfirmDeleteByUser")
    public String userConfirmDelete() {
        return "user/contacts/contactConfirmDeleteByUser";
    }

    @GetMapping(value = {"/contactDeleteByUser/{id}"})
    public String userDelete(@PathVariable long id) {
        contactRepository.deleteById(id);
        return "redirect:/contactsOfUser";
    }

    @GetMapping(value = {"/contactEditByUser/{id}"})
    public String contactEditForm(@PathVariable long id, Model model, Authentication authentication) {
        Optional<Contact> contact = contactRepository.findById(id);
        model.addAttribute("contactEditByUser", contact.get());
        model.addAttribute("user", userService.findByEmail(authentication.getName()));
        return "user/contacts/contactEditByUser";
    }

    @PostMapping(value = {"contactEditByUser/{id}"})
    public String contactEditSave(@Valid Contact contact, BindingResult result) {
        if (result.hasErrors()) {
            return "user/contacts/contactEditByUser";
        }
        contactRepository.save(contact);
        return "user/contacts/contactsOfUser";
    }
    @GetMapping("/forum")
    public String forum(Model model, Authentication authentication) {
        model.addAttribute("lastlyDonatedForum", donationRepository.findAll());
        return "user/contacts/forum";
    }
    @GetMapping(value = {"/contactDetailsByUser/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Contact> contact = contactRepository.findById(id);
        model.addAttribute("contactDetailsByUser", contact.get());
        return "user/contacts/contactDetailsByUser";
    }

}
