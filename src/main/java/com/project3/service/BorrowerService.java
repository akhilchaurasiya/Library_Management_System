package com.project3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.model.Borrower;
import com.project3.repository.BorrowerRepository;

@Service
public class BorrowerService {

    @Autowired
    private BorrowerRepository borrowerRepository;

    public List<Borrower> getAllBorrowers() {
        return borrowerRepository.findAll();
    }

    public void saveBorrower(Borrower borrower) {
        borrowerRepository.save(borrower);
    }

    public Borrower getBorrowerById(Long id) {
        return borrowerRepository.findById(id).orElse(null);
    }

    public void updateBorrower(Long id, Borrower borrower) {
        Borrower existingBorrower = getBorrowerById(id);
        if (existingBorrower != null) {
            existingBorrower.setName(borrower.getName());
            existingBorrower.setEmail(borrower.getEmail());
            borrowerRepository.save(existingBorrower);
        }
    }

    public void deleteBorrower(Long id) {
        borrowerRepository.deleteById(id);
    }
}
