# springboot-api-demo

Spring Boot RESt API demo is demonstrating how to implement simple CRUD operations with a `User` entity.

[![DepShield Badge](https://depshield.sonatype.org/badges/anuradhaneo/springboot-api-demo/depshield.svg)](https://depshield.github.io)

## What's inside 
This project is based on the [Spring Boot](http://projects.spring.io/spring-boot/) project and uses these packages :
- Maven
- Spring Core

## Installation 
The project is created with Maven, so you just need to import it to your IDE and build the project to resolve the dependencies

## Usage 
Run the project and head out to [http://localhost:8080]

## APIS
* {[/api/user/],methods=[GET]} - list all users  
* {[/api/user/{id}],methods=[GET]} - list specific user
* {[/api/user/],methods=[POST]} - Create a user
* {[/api/user/{id}],methods=[PUT]} - Update a user
* {[/api/user/],methods=[DELETE]} - Delete all users
* {[/api/user/{id}],methods=[DELETE]} - Delete a apecific user
