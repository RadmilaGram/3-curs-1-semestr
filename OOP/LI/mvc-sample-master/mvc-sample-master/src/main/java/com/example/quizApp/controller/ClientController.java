package com.example.quizApp.controller;


import com.example.quizApp.model.Client;
import com.example.quizApp.service.ClientService;
import com.example.quizApp.service.OrderService;
import com.example.quizApp.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/clients")
public class ClientController {

    @Autowired
    private PhotoService photoService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ClientService clientService;

    @GetMapping
    public String listClients(Model model) {
        model.addAttribute("clients", clientService.getAllClients());
        return "clients";
    }

    @GetMapping("/add")
    public String addClientForm(Model model) {
        model.addAttribute("client", new Client());
        return "add-client";
    }

    @PostMapping("/add")
    public String addClient(@ModelAttribute Client client) {
        clientService.saveClient(client);
        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public String editClientForm(@PathVariable int id, Model model) {
        model.addAttribute("client", clientService.getClientById(id));
        return "edit-client";
    }

    @PostMapping("/edit/{id}")
    public String editClient(@PathVariable int id, @ModelAttribute Client client) {
        clientService.updateClient(id, client);
        return "redirect:/";
    }


    @GetMapping("/delete/{id}")
    public String deleteClient(@PathVariable int id) {
        clientService.deleteClient(id);
        return "redirect:/";
    }

    @GetMapping("/search")
    public String searchClients(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        model.addAttribute("clients", clientService.searchClients(keyword));
        model.addAttribute("photos", photoService.getAllPhotos());
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("keyword", keyword != null ? keyword : ""); // Передаём введённый ключ или пустую строку
        return "dashboard";
    }



}
