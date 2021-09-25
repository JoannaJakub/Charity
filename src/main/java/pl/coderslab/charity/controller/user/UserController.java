package pl.coderslab.charity.controller.user;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {
    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserController(UserService userService, BCryptPasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping(value = {"/userPersonalDetails"})
    public String userPersonalDetails(Model model, Authentication authentication) {
        model.addAttribute("userPersonalDetails", userService.findByEmail(authentication.getName()));
        return "user/user/userPersonalDetails";
    }


    @GetMapping(value = {"/userEditPersonalDetails"})
    public String userEditPersonalDetails(Model model, Authentication authentication) {
        model.addAttribute("userEditPersonalDetails", userService.findByEmail(authentication.getName()));
        return "user/user/userEditPersonalDetails";
    }

    @PostMapping(value = "/userEditPersonalDetails")
    public String userEditPersonalDetailsSave(@Valid User user, BindingResult result) {
        String password = passwordEncoder.encode(user.getPassword());
        System.out.println("hgjghghghjg"+password);
        user.setRetypePassword(password);
        if (result.hasErrors()) {
            return "redirect:/userEditPersonalDetails";
        } else {
            userService.saveUser(user);
            return "redirect:/userConfirmEditPersonalDetails";
        }
    }

    @RequestMapping(value = "/userConfirmEditPersonalDetails")
    public String userEditPersonalDetailsConfirmation(Model model, Authentication authentication) {
        model.addAttribute("userEditPersonalDetails", userService.findByEmail(authentication.getName()));
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
