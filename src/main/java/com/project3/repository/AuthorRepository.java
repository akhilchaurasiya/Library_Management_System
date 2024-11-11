package com.project3.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project3.model.Author;

@Repository
public interface AuthorRepository extends JpaRepository<Author, Long> {
}
