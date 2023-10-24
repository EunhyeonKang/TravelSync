package com.hanacard.transitpay.member.controller;

import com.hanacard.transitpay.member.model.dao.CustomerRepository;
import com.hanacard.transitpay.member.model.dto.Customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MongoController {
    @Autowired
    private CustomerRepository repository;

    @RequestMapping("/mongotest")
    public void mongotest() throws Exception {
        repository.deleteAll();

        repository.save(new Customer("Alice", "Smith"));
        repository.save(new Customer("Bob", "Smith"));

        System.out.println("Customers found with findAll():");
        System.out.println("-------------------------------");
        for (
                Customer customer : repository.findAll()) {
            System.out.println(customer);
        }
        System.out.println();

        // fetch an individual customer
        System.out.println("Customer found with findByFirstName('Alice'):");
        System.out.println("--------------------------------");
        System.out.println(repository.findByFirstName("Alice"));

        System.out.println("Customers found with findByLastName('Smith'):");
        System.out.println("--------------------------------");
        for (Customer customer : repository.findByLastName("Smith")) {
            System.out.println(customer);
        }
    }

}
