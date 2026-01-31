package com.example.quizApp.repository;


import com.example.quizApp.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends JpaRepository<Client, Integer> {
    List<Client> findByNameContainingIgnoreCaseOrEmailContainingIgnoreCase(String name, String email);
}
