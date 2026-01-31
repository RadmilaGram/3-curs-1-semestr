package com.example.quizApp.service;

import com.example.quizApp.model.Client;
import com.example.quizApp.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientService {

    @Autowired
    private ClientRepository clientRepository;

    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }

    public void saveClient(Client client) {
        clientRepository.save(client);
    }

    public Client getClientById(int id) {
        return clientRepository.findById(id).orElseThrow(() -> new RuntimeException("Client not found"));
    }

    public void updateClient(int id, Client updatedClient) {
        Client client = getClientById(id);
        if (client != null) {
            client.setName(updatedClient.getName());
            client.setEmail(updatedClient.getEmail());
            client.setPhone(updatedClient.getPhone());
            clientRepository.save(client);
        }
    }

    public void deleteClient(int id) {
        clientRepository.deleteById(id);
    }

    public List<Client> searchClients(String keyword) {
        if (keyword != null && !keyword.isEmpty()) {
            return clientRepository.findByNameContainingIgnoreCaseOrEmailContainingIgnoreCase(keyword, keyword);
        }
        return clientRepository.findAll();
    }


}
