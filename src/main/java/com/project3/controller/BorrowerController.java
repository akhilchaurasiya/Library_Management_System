package com.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.model.Borrower;
import com.project3.service.BorrowerService;

@Controller
@RequestMapping("/borrowers")
public class BorrowerController {

    @Autowired
    private BorrowerService borrowerService;

    @GetMapping("/list")
    public String getAllBorrowers(Model model) {
        model.addAttribute("borrowers", borrowerService.getAllBorrowers());
        return "borrower-list";
    }

    @GetMapping("/add")
    public String addBorrowerForm(Model model) {
        model.addAttribute("borrower", new Borrower());
        return "borrower-form";
    }

    @PostMapping("/add")
    public String saveBorrower(@ModelAttribute("borrower") Borrower borrower) {
        borrowerService.saveBorrower(borrower);
        return "redirect:/borrowers/list";
    }

    @GetMapping("/edit/{id}")
    public String editBorrower(@PathVariable Long id, Model model) {
        Borrower borrower = borrowerService.getBorrowerById(id);
        model.addAttribute("borrower", borrower);
        return "borrower-form";
    }

    @PostMapping("/edit/{id}")
    public String updateBorrower(@PathVariable Long id, @ModelAttribute("borrower") Borrower borrower) {
        borrowerService.updateBorrower(id, borrower);
        return "redirect:/borrowers/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteBorrower(@PathVariable Long id) {
        borrowerService.deleteBorrower(id);
        return "redirect:/borrowers/list";
    }
}
