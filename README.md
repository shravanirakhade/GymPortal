# 🏋️ Universal Fitness – Gym Management System

Universal Fitness is a web-based Gym Management System developed using Java, JSP, Servlets, JDBC, MySQL, HTML, CSS, and Maven. The system is designed to simplify and manage the daily operations of a gym by providing separate functionality for gym members/users and administrators.

## 📖 Project Overview

The Universal Fitness Gym Management System provides a simple, user-friendly platform where members can register for gym memberships, view available membership plans, check their membership details, view applicable fees, and explore the facilities provided by the gym.

The system also provides an Admin module that allows the gym administrator to manage membership fee structures. Administrators can add new membership plans, edit existing plans, delete plans, and view all available membership plans.

The project demonstrates the implementation of a complete Java web application using JSP, Servlets, JDBC, MySQL, session management, and CRUD operations.

## ✨ Main Features

### 👤 User Module
- User Login and Authentication
- Session-based user management
- User Dashboard
- View Registration Status
- View Current Membership Plan
- View Membership Fees
- Register for a Membership
- View Available Membership Plans
- View Membership Details
- View Available Gym Facilities
- Logout functionality

### 👨‍💼 Admin Module
- Admin Login and Authentication
- Admin Dashboard
- Manage Fee Structure
- Add New Membership Plan
- View All Membership Plans
- Edit Membership Plans
- Delete Membership Plans
- Manage Membership Duration
- Manage Membership Amount
- Manage Facilities included in each plan
- Logout functionality

## 💳 Membership Plans

The system supports different membership plans such as:

- Basic – 1 Month
- Standard – 3 Months
- Premium – 1 Year

The administrator can modify these plans according to the gym's requirements.

## 🗄️ Database

MySQL is used as the backend database.

JDBC is used to establish communication between the Java application and MySQL database.

The application performs database operations such as:

- Insert
- Select
- Update
- Delete

These operations are mainly demonstrated through the Admin Fee Management module.

## 🛠️ Technologies Used

### Frontend
- HTML5
- CSS3
- JSP

### Backend
- Java
- Java Servlets
- JDBC

### Database
- MySQL

### Development Tools
- Eclipse IDE
- Apache Tomcat 9
- Maven
- Git & GitHub

## 🏗️ Project Architecture

The project follows a Java web application architecture where:

User/Admin
   ↓
JSP Pages
   ↓
Servlets
   ↓
JDBC
   ↓
MySQL Database

JSP is used for the presentation layer, Servlets handle application logic and requests, JDBC manages database connectivity, and MySQL stores application data.

## 🔐 Authentication & Session Management

The system uses login authentication and HTTP sessions to control access to user and admin pages.

After successful login, users are redirected to the appropriate dashboard based on their role.

Admin pages are protected so that only authenticated administrators can access administrative operations.

## 🎨 User Interface

The project includes a responsive and attractive user interface with:

- Modern gym-themed design
- Dashboard cards
- Membership plan cards
- Navigation sections
- Login page
- Admin management tables
- User-friendly buttons and forms
- Custom CSS styling

## 📋 CRUD Operations

The Admin Fee Structure module demonstrates complete CRUD functionality:

**Create**  
Add a new membership fee plan.

**Read**  
Display all available membership plans.

**Update**  
Edit an existing membership plan.

**Delete**  
Remove a membership plan after confirmation.

## 🎯 Purpose of the Project

The main purpose of this project is to develop a practical Gym Management System while demonstrating the use of Java web development technologies.

It provides practical experience in:

- Java Web Development
- JSP
- Servlets
- JDBC
- MySQL Database Connectivity
- CRUD Operations
- Session Management
- Authentication
- MVC-style application development
- Maven project structure
- Frontend design using HTML and CSS

## 🚀 Future Enhancements

The project can be further enhanced by adding:

- Online membership payment
- Payment history
- Email notifications
- Attendance management
- Trainer management
- Workout plans
- Member search and filtering
- Membership expiry notifications
- Admin analytics dashboard
- Reports and downloadable receipts
- Password encryption and improved authentication
- REST API integration

## 👩‍💻 Project

**Project Name:** Universal Fitness – Gym Management System

**Technology:** Java | JSP | Servlets | JDBC | MySQL | HTML | CSS | Maven

**IDE:** Eclipse

**Server:** Apache Tomcat 9

This project was developed as a practical Java web application to understand and implement real-world concepts of database-driven web application development.
