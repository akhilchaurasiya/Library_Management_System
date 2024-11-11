package com.project3.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.model.BorrowRecord;
import com.project3.repository.BorrowRecordRepository;

@Service
public class BorrowRecordService {

    @Autowired
    private BorrowRecordRepository borrowRecordRepository;

    public List<BorrowRecord> getAllBorrowRecords() {
        return borrowRecordRepository.findAll();
    }

    public void borrowBook(BorrowRecord record) {
        record.setBorrowDate(LocalDate.now());
        record.setDueDate(LocalDate.now().plusDays(14)); // 2 weeks borrowing period
        borrowRecordRepository.save(record);
    }
    
    public BorrowRecord getBorrowRecordById(Long id) {
        return borrowRecordRepository.findById(id).orElse(null);
    }

    public void saveBorrowRecord(BorrowRecord record) {
        borrowRecordRepository.save(record);  // Save or update the borrow record
    }


    public BorrowRecord returnBook(Long id) {
        BorrowRecord record = borrowRecordRepository.findById(id).orElse(null);
        if (record != null && !record.isReturned()) {
            record.setReturnDate(LocalDate.now());
            record.setReturned(true);
            borrowRecordRepository.save(record);
        }
        return record;
    }

    public void renewBook(Long id) {
        BorrowRecord record = borrowRecordRepository.findById(id).orElse(null);
        if (record != null && !record.isReturned()) {
            record.setDueDate(record.getDueDate().plusDays(7)); // 1 week extension
            borrowRecordRepository.save(record);
        }
    }

    // Fine calculation logic
    public double calculateFine(Long id) {
        BorrowRecord record = borrowRecordRepository.findById(id).orElse(null);
        if (record != null && record.getReturnDate() != null) {
            long daysLate = record.getReturnDate().toEpochDay() - record.getDueDate().toEpochDay();
            if (daysLate > 0) {
                return daysLate * 5.0; // 5 currency units fine per day
            }
        }
        return 0.0;
    }
}
