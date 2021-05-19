package pl.coderslab.charity.controller.user;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.ContactRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

@Controller
public class UserInstitutionController {
    private final InstitutionRepository institutionRepository;


    public UserInstitutionController(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @GetMapping("/institutionAddByUser")
    public String institutionAddForm(Model model) {
        model.addAttribute("institutionAddByUser", new Institution());
        return "user/institutionAddByUser";
    }

    @RequestMapping(value = "/institutionAddByUserSuccess", method = RequestMethod.POST)
    public String institutionAddSuccess(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "user/institutionAddByUser";
        }
        institutionRepository.save(institution);
        return "user/institutionAddByUserSuccess";

    }

}
