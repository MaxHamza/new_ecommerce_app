# eb_tech_task

A new Flutter project.
# 🛒 New E-Commerce Flutter App

## 📱 Overview

This is a simple E-Commerce mobile application built using Flutter.  
The app allows users to browse products, view product details, manage a shopping cart, and add new products to the store using Fake Store API.

The project was developed as a technical task within a limited deadline.

---

## 🚀 Features

### 🏠 Home Page
- Display all products from Fake Store API
- Display product categories
- Clean and responsive UI

### 📦 Product Details Page
- Show full product information
- Display image, title, price, and description
- Add product to cart

### 🛒 Cart Page
- Display selected products
- Manage product quantity
- Remove products from cart
- Calculate total price dynamically

### ➕ Add Product Page
- Add new product to store using POST API
- Form validation
- Send data to Fake Store API

---

#### 🌐 API Used

This project uses Fake Store API:

https://fakestoreapi.com/docs

### Endpoints used:
- GET /products
- GET /products/categories
- POST /products

---

## 🧱 Tech Stack

- Flutter
- Dart
- Dio (HTTP requests)
- Hive (Local storage)
- Cubit / Bloc (State Management)

---

### 📦 Project Structure
lib/
├── core/
├── features/
│ ├── home/
│ ├── product_details/
│ ├── cart/
│ ├── add_product/
├── main.dart


---

## 🛠️ How to Run

bash
git clone https://github.com/MaxHamza/new_ecommerce_app.git
cd new_ecommerce_app
flutter pub get
flutter run

## 🧠 Notes
Cart is stored locally using Hive
Products are fetched from Fake Store API
Add Product uses POST request (Fake Store behavior)
App is built with clean architecture principles

## 👨‍💻 Developer
Name: Hamza
Role: Flutter Developer
Focus: Mobile Development

## 📌 Task Completion Status

✔ Home Page
✔ Product Details
✔ Cart Page
✔ Add Product Feature