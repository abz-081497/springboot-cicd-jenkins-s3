package com.springboot.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/*
 * this is the main class
 */

@SpringBootApplication(scanBasePackages = {"com.springboot.api"})
// same as @Configuration @EnableAutoConfiguration @ComponentScan combined
public class SpringBootRestApiApp {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootRestApiApp.class, args);
    }
}
