package pl.coderslab.charity.controller.user;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.*;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = {"/userPersonalDetails"})
    public String userPersonalDetails(Model model, Authentication authentication) {
        model.addAttribute("userPersonalDetails", userService.findByEmail(authentication.getName()));
        return "user/user/userPersonalDetails";
    }


    @GetMapping(value = {"/userEditPersonalDetails"})
    public String userEditPersonalDetails(Model model, Authentication authentication, @Valid User user) {
        model.addAttribute("userEditPersonalDetails", userService.findByEmail(authentication.getName()));
        return "user/user/userEditPersonalDetails";
    }

    @PostMapping(value = "/userConfirmEditPersonalDetails")
    public String userEditPersonalDetailsConfirmation(@Valid User user, BindingResult result, Authentication authentication) {
        userService.saveUser(user);
        return "user/user/userConfirmEditPersonalDetails";
    }

    @GetMapping(value = {"/changePassword"})
    public String userChangePassword(Authentication authentication, Model model) {
        model.addAttribute("changePassword", userService.findByEmail(authentication.getName()));
        return "user/user/changePassword";
    }

    @PostMapping(value = {"changePasswordSuccess"})
    public String userChangePasswordSave(@Valid User user) {
        String encodedPassword = String.valueOf(new BCryptPasswordEncoder());
        user.setPassword(encodedPassword);
        return "redirect:/changePasswordSuccess";
    }

}
