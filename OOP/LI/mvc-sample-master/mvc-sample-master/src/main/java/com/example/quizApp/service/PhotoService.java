package com.example.quizApp.service;

import com.example.quizApp.model.Photo;
import com.example.quizApp.repository.PhotoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Base64;
import java.util.List;


@Service
public class PhotoService {

    @Autowired
    private PhotoRepository photoRepository;

    public List<Photo> getAllPhotos() {
        return photoRepository.findAll();
    }

    public void savePhoto(Photo photo) {
        if (photo == null || photo.getImage() == null || photo.getImage().length == 0) {
            throw new RuntimeException("Photo or image data cannot be null");
        }
            photoRepository.save(photo);
    }

    public Photo getPhotoById(int id) {
        return photoRepository.findById(id).orElseThrow(() -> new RuntimeException("Photo not found"));
    }


    public void updatePhoto(int id, Photo updatedPhoto) {
        Photo photo = getPhotoById(id);
        if (photo != null) {
            photo.setTitle(updatedPhoto.getTitle());
            photo.setDescription(updatedPhoto.getDescription());
            photo.setDateTaken(updatedPhoto.getDateTaken());
            photo.setClient(updatedPhoto.getClient());
            photoRepository.save(photo);
        }
    }

    public void deletePhoto(int id) {
        photoRepository.deleteById(id);
    }

    public List<Photo> searchPhotos(String keyword) {
        if (keyword != null && !keyword.isEmpty()) {
            return photoRepository.findByTitleContainingIgnoreCaseOrDescriptionContainingIgnoreCase(keyword, keyword);
        }
        return photoRepository.findAll();
    }
/////////////////////////////////
    public String getBase64Image(byte[] imageBytes) {
        return Base64.getEncoder().encodeToString(imageBytes);
    }

}

