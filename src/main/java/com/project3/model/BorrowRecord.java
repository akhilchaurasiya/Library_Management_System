package com.project3.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Transient;
import lombok.Data;

@Data
@Entity
public class BorrowRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    private Borrower borrower;
    
    @ManyToOne
    private Book book;
    
    private LocalDate borrowDate;
    private LocalDate returnDate;
    private LocalDate dueDate;
    
    private boolean isReturned = false;
    
    @Transient
    private double fine;
}
