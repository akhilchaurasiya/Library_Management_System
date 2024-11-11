package com.project3.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.model.Book;
import com.project3.model.BorrowRecord;
import com.project3.model.Borrower;
import com.project3.service.BookService;
import com.project3.service.BorrowRecordService;
import com.project3.service.BorrowerService;

@Controller
@RequestMapping("/borrowRecords")
public class BorrowRecordController {

    @Autowired
    private BorrowRecordService borrowRecordService;
    
    @Autowired
    private BorrowerService borrowerService;
    
    @Autowired
    private BookService bookService;

    @GetMapping("/list")
    public String getAllBorrowRecords(Model model) {
        model.addAttribute("records", borrowRecordService.getAllBorrowRecords());
        return "borrow-record-list";
    }

    @GetMapping("/borrow")
    public String borrowBookForm(Model model) {
        model.addAttribute("record", new BorrowRecord());
        model.addAttribute("borrowers", borrowerService.getAllBorrowers());
        model.addAttribute("books", bookService.getAllBooks());
        return "borrow-form";
    }

 // Handles the modal form submission to borrow a book
    @PostMapping("/borrow")
    public String borrowBook(@RequestParam("borrowerName") String borrowerName, @RequestParam("borrowerEmail") String borrowerEmail, @RequestParam("bookId") Long bookId) {
        Borrower borrower = new Borrower();
        borrower.setName(borrowerName);
        borrower.setEmail(borrowerEmail);
        borrowerService.saveBorrower(borrower);  // Save the borrower

        Book book = bookService.getBookById(bookId);
        
        BorrowRecord record = new BorrowRecord();
        record.setBorrower(borrower);
        record.setBook(book);
        
        borrowRecordService.borrowBook(record);
        
        return "redirect:/borrowRecords/list";
    }

 // Handle returning a book and calculate fine if any
    @GetMapping("/return/{id}")
    public String returnBook(@PathVariable Long id, Model model) {
        BorrowRecord record = borrowRecordService.returnBook(id); // Mark as returned

        // Calculate fine
        double fine = borrowRecordService.calculateFine(id);
        
        // Pass fine to the model so it can be displayed
        model.addAttribute("fine", fine);
        model.addAttribute("record", record);
        
        return "return-confirmation";  // Redirect to return confirmation page
    }

    @GetMapping("/renew/{id}")
    public String renewBook(@PathVariable Long id) {
        BorrowRecord record = borrowRecordService.getBorrowRecordById(id);  // Get the record

        if (record != null && !record.isReturned()) {  // Only renew if not returned
            // Extend the borrow date and due date (reissue the book)
            record.setBorrowDate(LocalDate.now());  // Set the borrow date to now
            record.setDueDate(LocalDate.now().plusDays(14));  // Extend due date to 2 more weeks
            borrowRecordService.saveBorrowRecord(record);  // Save the updated borrow record
        }

        return "redirect:/borrowRecords/list";  // Redirect back to the list
    }


    @GetMapping("/fine/{id}")
    public String calculateFine(@PathVariable Long id, Model model) {
        double fine = borrowRecordService.calculateFine(id);
        model.addAttribute("fine", fine);
        return "fine";
    }
}
