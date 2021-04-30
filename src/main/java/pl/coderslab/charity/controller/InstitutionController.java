package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;


import javax.validation.Valid;
import java.util.Optional;

@Controller
public class InstitutionController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    public InstitutionController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;

        this.donationRepository = donationRepository;
    }

    @GetMapping(value = {"/adminInstitution"})
    public String adminInstitution(Model model) {
        model.addAttribute("adminInstitution", institutionRepository.findAll());
        return "admin/institutions/adminInstitution";

    }

    @RequestMapping("/institutionConfirmDelete")
    public String institutionConfirmDelete() {
        return "admin/institutions/institutionConfirmDelete";
    }

    @GetMapping(value = {"/institutionDelete/{id}"})
    public String institutionDelete(@PathVariable long id) {
        institutionRepository.deleteById(id);
        return "redirect:/adminInstitution";
    }

    @GetMapping(value = {"/institutionEdit/{id}"})
    public String institutionEditForm(@PathVariable long id, Model model) {
        model.addAttribute("institutionEdit", institutionRepository.findById(id));
        return "admin/institutions/institutionEdit";
    }

    @PostMapping(value = {"institutionEdit/{id}"})
    public String institutionEditSave(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "institutionEdit";
        }
        institutionRepository.save(institution);
        return "redirect:/adminInstitution";
    }

    @GetMapping(value = {"/institutionDetails/{id}"})
    public String donationDetails(@PathVariable long id, Model model) {
        Optional<Institution> institution = institutionRepository.findById(id);

        model.addAttribute("institutionDetails", institution.get());
        model.addAttribute("oneInstitutionDonations", donationRepository.findDonationByInstitutionId(id));
        return "admin/institutions/institutionDetails";
    }

    @GetMapping("/institutionAdd")
    public String institutionAddForm(Model model) {
        model.addAttribute("institutionAdd", new Institution());
        return "admin/institutions/institutionAdd";
    }

    @RequestMapping(value = "/institutionAddSuccess", method = RequestMethod.POST)
    public String institutionAddSuccess(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/institutions/institutionAdd";
        }
        institutionRepository.save(institution);
        return "admin/institutions/institutionAddSuccess";

    }

}
