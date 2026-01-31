package com.example.quizApp.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "photos")

public class Photo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;
    private String description;

    @Column(name = "date_taken")
    private LocalDate dateTaken;

    @ManyToOne
    @JoinColumn(name = "client_id", nullable = false)
    private Client client;

    //1
    @Lob // Для хранения больших объектов
    @Column(name = "image", nullable = false)
    private byte[] image; // Поле для хранения фото

    public void setFilePath(String filePath) {
    }


    //  @Column(name = "file_path")
   // private String filePath; // Новый столбец для хранения пути к изображению
}
