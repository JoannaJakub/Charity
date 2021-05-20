package pl.coderslab.charity.controller.user;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.ContactRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.Optional;

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
    @GetMapping(value = {"/institutionDetailsByUser/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Institution> institution = institutionRepository.findById(id);
        model.addAttribute("institutionDetailsByUser", institution.get());
        return "user/institutionDetailsByUser";
    }

}
