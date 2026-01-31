package com.example.quizApp.controller;

import com.example.quizApp.model.Order;
import com.example.quizApp.service.ClientService;
import com.example.quizApp.service.OrderService;
import com.example.quizApp.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private ClientService clientService; // Внедрение ClientService

    @Autowired
    private PhotoService photoService;

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String listOrders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        return "orders";
    }

    @GetMapping("/add")
    public String addOrderForm(Model model) {
        model.addAttribute("order", new Order());
        model.addAttribute("clients", clientService.getAllClients()); // Передаем список клиентов
        return "add-order";
    }

    @PostMapping("/add")
    public String addOrder(@ModelAttribute Order order, @RequestParam int clientId) {
        order.setClient(clientService.getClientById(clientId)); // Установить клиента по ID
        orderService.saveOrder(order);
        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public String editOrderForm(@PathVariable int id, Model model) {
        Order order = orderService.getOrderById(id); // Получение текущего заказа
        model.addAttribute("order", order);
        model.addAttribute("clients", clientService.getAllClients()); // Список клиентов для выпадающего списка
        //model.addAttribute("selectedClientId", order.getClient().getId()); // ID текущего клиента
        return "edit-order";
    }


    @PostMapping("/edit/{id}")
    public String editOrder(@PathVariable int id, @ModelAttribute Order order, @RequestParam int clientId) {
        order.setClient(clientService.getClientById(clientId)); // Устанавливаем клиента по ID
        orderService.updateOrder(id, order);
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable int id) {
        orderService.deleteOrder(id);
        return "redirect:/";
    }

    @GetMapping("/search")
    public String searchOrders(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        model.addAttribute("clients", clientService.getAllClients());
        model.addAttribute("photos", photoService.getAllPhotos());
        model.addAttribute("orders", orderService.searchOrders(keyword));
        model.addAttribute("keyword", keyword != null ? keyword : ""); // Передаём введённый ключ или пустую строку
        return "dashboard";
    }


}
