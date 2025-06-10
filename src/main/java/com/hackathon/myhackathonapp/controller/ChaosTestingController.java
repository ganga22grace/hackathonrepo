package com.hackathon.myhackathonapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChaosTestingController {

    @GetMapping("/testMyApp")
    public String helloWorld() {
        return "Hello, ECS World!";
    }
}
