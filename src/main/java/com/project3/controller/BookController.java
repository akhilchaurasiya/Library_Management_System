package com.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project3.model.Book;
import com.project3.model.Author;
import com.project3.service.BookService;
import com.project3.service.AuthorService;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private AuthorService authorService;

    // List all books
    @GetMapping("/list")
    public String getAllBooks(Model model) {
        model.addAttribute("books", bookService.getAllBooks());
        return "book-list";
    }

    // Show form to add a new book
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("authors", authorService.getAllAuthors());
        model.addAttribute("formAction", "/books/add");
        return "book-form";
    }

    // Save a new book
    @PostMapping("/add")
    public String saveBook(@ModelAttribute("book") Book book, @RequestParam("authorId") Long authorId, RedirectAttributes redirectAttributes) {
        // Validate that required fields are not empty
        if (book.getTitle() == null || book.getTitle().isEmpty() || 
            book.getIsbn() == null || book.getIsbn().isEmpty() || authorId == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "All fields are required.");
            return "redirect:/books/add";
        }

        Author author = authorService.getAuthorById(authorId);
        if (author == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Selected author does not exist.");
            return "redirect:/books/add";
        }

        book.setAuthor(author);
        bookService.saveBook(book);
        redirectAttributes.addFlashAttribute("successMessage", "Book added successfully!");
        return "redirect:/books/list";
    }

    // Show form to edit an existing book
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        Book book = bookService.getBookById(id);
        if (book == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Book not found.");
            return "redirect:/books/list";
        }
        model.addAttribute("book", book);
        model.addAttribute("authors", authorService.getAllAuthors());
        model.addAttribute("formAction", "/books/edit/" + id);
        return "book-form";
    }

    // Update an existing book
    @PostMapping("/edit/{id}")
    public String updateBook(@PathVariable Long id, @ModelAttribute("book") Book book, @RequestParam("authorId") Long authorId, RedirectAttributes redirectAttributes) {
        // Validate that required fields are not empty
        if (book.getTitle() == null || book.getTitle().isEmpty() || 
            book.getIsbn() == null || book.getIsbn().isEmpty() || authorId == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "All fields are required.");
            return "redirect:/books/edit/" + id;
        }

        Author author = authorService.getAuthorById(authorId);
        if (author == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Selected author does not exist.");
            return "redirect:/books/edit/" + id;
        }

        book.setAuthor(author);
        bookService.updateBook(id, book);
        redirectAttributes.addFlashAttribute("successMessage", "Book updated successfully!");
        return "redirect:/books/list";
    }

    // Delete a book by ID
    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Book book = bookService.getBookById(id);
        if (book == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Book not found.");
            return "redirect:/books/list";
        }
        bookService.deleteBook(id);
        redirectAttributes.addFlashAttribute("successMessage", "Book deleted successfully!");
        return "redirect:/books/list";
    }
}
