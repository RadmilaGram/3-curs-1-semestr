package com.example.quizApp.service;

import com.example.quizApp.model.Order;
import com.example.quizApp.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    public Order getOrderById(int id) {
        return orderRepository.findById(id).orElse(null);
    }

    public void updateOrder(int id, Order updatedOrder) {
        Order order = getOrderById(id);
        if (order != null) {
            order.setOrderDate(updatedOrder.getOrderDate());
            order.setStatus(updatedOrder.getStatus());
            order.setClient(updatedOrder.getClient());
            orderRepository.save(order);
        }
    }

    public void deleteOrder(int id) {
        orderRepository.deleteById(id);
    }

    public List<Order> searchOrders(String keyword) {
        if (keyword != null && !keyword.isEmpty()) {
            return orderRepository.findByStatusContainingIgnoreCase(keyword);
        }
        return orderRepository.findAll();
    }


}

