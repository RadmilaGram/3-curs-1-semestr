package com.example.quizApp.repository;

import com.example.quizApp.model.Photo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PhotoRepository extends JpaRepository<Photo, Integer> {
    List<Photo> findByTitleContainingIgnoreCaseOrDescriptionContainingIgnoreCase(String title, String description);
}
