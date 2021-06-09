package pl.coderslab.charity.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.validation.Valid;
import java.util.List;
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
        List<Institution> institution = institutionRepository.findAll();
        model.addAttribute("institutionList", institution);
        return "user/institutions/institutionAddByUser";
    }

    @PostMapping(value = "/institutionAddByUserSuccess")
    public String institutionAddSuccess(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "user/institutions/institutionAddByUser";
        }
        institutionRepository.save(institution);
        return "user/institutions/institutionAddByUserSuccess";
    }

    @GetMapping(value = {"/institutionDetailsByUser/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Institution> institution = institutionRepository.findById(id);
        if (institution.isPresent()) {
            model.addAttribute("institutionDetailsByUser", institution.get());
        }else{ return "admin/adminError";}
        return "user/institutions/institutionDetailsByUser";
    }
}
