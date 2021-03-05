package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;


@Controller
public class HomeController {
    @Autowired
    InstitutionRepository institutionRepository;

    @RequestMapping("/")
    public String homeAction(Model model){
        List<Institution> institution = institutionRepository.findAll();
        model.addAttribute("institution", institution);
        return "index";
    }

    @RequestMapping("/form")
    public String formAction(Model model){
        return "form";
    }

    @RequestMapping("/formConfirmation")
    public String formConfirmationAction(Model model){
        return "form-confirmation";
    }

    @RequestMapping("/login")
    public String loginAction(Model model){  return "login";}

    @RequestMapping("/register")
    public String registerAction(Model model){  return "register";}
    }

