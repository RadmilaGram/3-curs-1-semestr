package com.example.quizApp.controller;


import com.example.quizApp.model.Client;
import com.example.quizApp.model.Order;
import com.example.quizApp.model.Photo;
import com.example.quizApp.service.ClientService;
import com.example.quizApp.service.PhotoService;
import com.example.quizApp.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private ClientService clientService;

    @Autowired
    private PhotoService photoService;

    @Autowired
    private OrderService orderService;

    @GetMapping("/")
    public String dashboard(Model model) {
        // Получение данных из всех сервисов
        model.addAttribute("clients", clientService.getAllClients());
        model.addAttribute("photos", photoService.getAllPhotos());
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("keyword", ""); // Передаём пустую строку по умолчанию
        return "dashboard"; // Ссылается на файл dashboard.mustache
    }

    @GetMapping("/search")
    public String search(
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model
    ) {
        // Заполнение данных для клиентов, фотографий и заказов
        List<Client> clients = clientService.searchClients(keyword);
        List<Photo> photos = photoService.searchPhotos(keyword);
        List<Order> orders = orderService.searchOrders(keyword);

        // Добавляем данные в модель
        model.addAttribute("clients", clients);
        model.addAttribute("photos", photos);
        model.addAttribute("orders", orders);
        model.addAttribute("keyword", keyword != null ? keyword : "");

        return "dashboard"; // Шаблон для отображения
    }

    @GetMapping("/dashboard")
    public String showDashboard(
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {
        model.addAttribute("clients", clientService.getAllClients());
        model.addAttribute("photos", photoService.getAllPhotos());
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("keyword", keyword != null ? keyword : ""); // Добавляем keyword
        return "dashboard";
    }
}

