package pl.coderslab.charity.controller.user;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.ContactRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class UserContactController {
    private final UserService userService;
    private final ContactRepository contactRepository;


    public UserContactController(UserService userService, ContactRepository contactRepository) {
        this.userService = userService;
        this.contactRepository = contactRepository;
    }

    @GetMapping("/contactAddByUser")
    public String contactAddByUser(Model model, Authentication authentication) {
        model.addAttribute("contactAddByUser", new Contact());
        model.addAttribute("user", userService.findByEmail(authentication.getName()));
        return "user/contactAddByUser";
    }

    @RequestMapping(value = "/contactAddByUserSuccess", method = RequestMethod.POST)
    private String contactAddByUserConfirmationAction(@Valid Contact contact, BindingResult result) {

        if (result.hasErrors()) {
            return "user/contactAddByUser";
        }
        contactRepository.save(contact);
        return "user/contactAddByUserSuccess";
    }

    @GetMapping(value = {"/contactsOfUser"})
    public String contactsOfUser(Model model, Authentication authentication) {
        User user = userService.findByEmail(authentication.getName());
        model.addAttribute("contactsOfUser", contactRepository.findContactByUserId(user.getId()));
        return "user/contactsOfUser";

    }
    @RequestMapping("/contactConfirmDeleteByUser")
    public String userConfirmDelete() {
        return "user/contactConfirmDeleteByUser";
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
        return "user/contactEditByUser";
    }

    @PostMapping(value = {"contactEditByUser/{id}"})
    public String contactEditSave(@Valid Contact contact, BindingResult result) {
        if (result.hasErrors()) {
            return "user/contactEditByUser";
        }
        contactRepository.save(contact);
        return "user/contactsOfUser";
    }

}
