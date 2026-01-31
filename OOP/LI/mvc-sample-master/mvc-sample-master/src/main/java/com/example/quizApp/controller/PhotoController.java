package com.example.quizApp.controller;

import com.example.quizApp.model.Client;
import com.example.quizApp.model.Photo;
import com.example.quizApp.service.ClientService;
import com.example.quizApp.service.OrderService;
import com.example.quizApp.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/photos")
public class PhotoController {

    @Autowired
    private ClientService clientService; // Внедрение ClientService

    @Autowired
    private OrderService orderService; // Внедрение OrderService

    @Autowired
    private PhotoService photoService;


    @GetMapping
    public String listPhotos(Model model) {
        model.addAttribute("photos", photoService.getAllPhotos());
        return "photos";
    }

    @GetMapping("/add")
    public String addPhotoForm(Model model) {
        model.addAttribute("photo", new Photo());
        model.addAttribute("clients", clientService.getAllClients());
        return "add-photo";
    }
//ттттуууут

    @PostMapping("/add")
    public String addPhoto(@ModelAttribute Photo photo,
                           @RequestParam int clientId,
                           @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        // Убедитесь, что клиент существует
        Client client = clientService.getClientById(clientId);
        if (client == null) {
            throw new RuntimeException("Client not found with id: " + clientId);
        }

        // Установите данные клиента
        photo.setClient(client);

        // Обработайте файл изображения
        if (imageFile != null && !imageFile.isEmpty()) {
            photo.setImage(imageFile.getBytes());
        }

        // Сохраните фото
        photoService.savePhoto(photo);

        // Перенаправьте на страницу с фото или на дашборд
        return "redirect:/dashboard";
    }

  /* @PostMapping("/add")
    public String addPhoto(
            @ModelAttribute Photo photo,
            @RequestParam int clientId,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        photo.setClient(clientService.getClientById(clientId));

        // Сохранение файла на сервер
        String uploadDir = "uploads/";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) uploadDirFile.mkdirs();

        String filePath = uploadDir + file.getOriginalFilename();
        file.transferTo(new File(filePath));
        photo.setFilePath(filePath);

        photoService.savePhoto(photo);
        return "redirect:/photos";
    }*/

    @GetMapping("/edit/{id}")
    public String editPhotoForm(@PathVariable int id, Model model) {
        Photo photo = photoService.getPhotoById(id); // Получаем фотографию по ID
        model.addAttribute("photo", photo); // Передаём текущую фотографию
        model.addAttribute("clients", clientService.getAllClients()); // Передаём список всех клиентов
        //model.addAttribute("selectedClientId", photo.getClient().getId()); // Передаём ID текущего клиента
        return "edit-photo";
    }

    @PostMapping("/edit/{id}")
    public String editPhoto(
            @PathVariable int id,
            @ModelAttribute Photo photo,
            @RequestParam int clientId,
            @RequestParam(value = "file", required = false) MultipartFile file
    ) throws IOException {
        Photo existingPhoto = photoService.getPhotoById(id);
        existingPhoto.setTitle(photo.getTitle());
        existingPhoto.setDescription(photo.getDescription());
        existingPhoto.setDateTaken(photo.getDateTaken());
        existingPhoto.setClient(clientService.getClientById(clientId));

        if (file != null && !file.isEmpty()) {
            String uploadDir = "uploads/";
            String filePath = uploadDir + file.getOriginalFilename();
            file.transferTo(new File(filePath));
            existingPhoto.setFilePath(filePath);
        }

        photoService.savePhoto(existingPhoto);
        return "redirect:/photos";
    }

    /*@PostMapping("/edit/{id}")
    public String editPhoto(@PathVariable int id, @ModelAttribute Photo photo, @RequestParam int clientId) {
        Photo existingPhoto = photoService.getPhotoById(id); // Получаем существующую запись
        existingPhoto.setTitle(photo.getTitle());
        existingPhoto.setDescription(photo.getDescription());
        existingPhoto.setDateTaken(photo.getDateTaken());
        existingPhoto.setClient(clientService.getClientById(clientId)); // Устанавливаем нового клиента
        photoService.savePhoto(existingPhoto); // Сохраняем изменения
        return "redirect:/";
    }*/

    @GetMapping("/delete/{id}")
    public String deletePhoto(@PathVariable int id) {
        photoService.deletePhoto(id);
        return "redirect:/";
    }

    @GetMapping("/search")
    public String searchPhotos(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        model.addAttribute("clients", clientService.getAllClients());
        model.addAttribute("photos", photoService.searchPhotos(keyword));
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("keyword", keyword != null ? keyword : ""); // Передаём введённый ключ или пустую строку
        return "dashboard";
    }


}

