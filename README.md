# 🍅 Smart Tomato Inventory System

A full-stack IoT and software solution for **real-time tracking of tomato crates** using **ESP32**, **RFID**, and **OLED**, with a backend built on **Spring Boot** and **PostgreSQL**, and a dynamic **JSP web dashboard** featuring interactive maps powered by **Leaflet.js**.

This project enhances tomato inventory visibility, reduces spoilage, and empowers intermediaries and farmers with transparent, real-time data.



##  Key Features

-  **RFID-Based Tracking** of individual tomato crates.
-  **ESP32** reads RFID tags and sends data over WiFi to the backend.
-  **OLED Display** shows scanned crate info instantly.
-  **JSP Web Dashboard** with Leaflet.js for real-time crate monitoring.
-  Automatic detection of **expired crates** using timestamps.
-  Backend built using **Spring Boot** with clean MVC architecture.
-  **PostgreSQL** for efficient and scalable data storage.
-  **REST APIs** for system integration and scalability.



##  System Architecture

[ESP32 + MFRC522 RFID Reader + OLED Display]
↓ WiFi (HTTP POST)
[Spring Boot REST API Server]
↓
[PostgreSQL Database]
↓
[Web Dashboard with Maps]




---

##  Technology Stack

| Layer            | Tools & Frameworks                      |
|------------------|------------------------------------------|
| Frontend         | JSP, HTML, CSS, Leaflet.js               |
| Backend          | Spring Boot, REST APIs                   |
| Database         | PostgreSQL                               |
| Microcontroller  | ESP32                                    |
| Sensors/Modules  | MFRC522 RFID Reader, OLED SSD1306        |
| Libraries (ESP32)| WiFi, HTTPClient, MFRC522, Adafruit GFX  |

---

##  How It Works

1.  ESP32 scans an RFID tag using the **MFRC522 Reader**.
2.  The **OLED display** shows the tag UID immediately.
3.  ESP32 sends the tag data to a **Spring Boot REST API** via HTTP POST.
4.  The backend stores data with **timestamps** in PostgreSQL.
5.  The **dashboard** updates in real time, showing crate status, age, and location.

---

## 🔗 REST API Endpoints

| Method | Endpoint      | Description                        |
|--------|----------------|-------------------------------------|
| POST   | `/addTag`      | Accept tag data from ESP32         |
| GET    | `/expired`     | List of expired tomato crates      |
| GET    | `/dashboard`   | Loads the web-based dashboard      |

---

## 📸 Live Dashboard Snapshots

### 👇 Dashboard Overview with Total, Fresh & Expired Crates
![Dashboard Overview](https://github.com/user-attachments/assets/b3283a12-0a5d-4711-b93a-2ae408eaa8c9)

---

### 📍 Real-Time Location Mapping with Leaflet.js
![Leaflet Map View](https://github.com/user-attachments/assets/9c50fd52-d5bd-422c-b5c3-4d0d44d09fb1)

---

### 🟢 Crate Status Visuals (Fresh / Expired)
![Status View](https://github.com/user-attachments/assets/e4c2a81b-a681-47a9-99bb-8674d904fa77)

---

### 🧾 Tag History & Timestamps
![Tag List View](https://github.com/user-attachments/assets/36feea5a-052f-4739-bf96-3e2b88ffd060)

---

### 🔍 Individual Tag Tracking
![Single Tag Info](https://github.com/user-attachments/assets/0922d477-ce89-4b9a-815f-f2b0b77796d2)

---

### 📲 Data Transmission from ESP32
![ESP32 to API](https://github.com/user-attachments/assets/21eed83f-eb30-4aac-b2d5-983b2e2fa30d)

---

## 👨‍💻 Developed By

**Vikas KA**  
📅 June 2025  
🎯 Hackathon Project: IoT + Spring Boot + PostgreSQL

---

## 🧠 Project Impact

- ✅ Reduces manual tracking and errors in tomato supply chain.
- 🌿 Helps avoid spoilage with expiration monitoring.
- 📦 Enables smarter logistics with crate-level visibility.
- 👨‍🌾 Empowers intermediaries, cold storage units, and farmers alike.

---

## 🛠️ Future Enhancements

- 🛰️ GPS module integration for geolocation tracking.
- 📱 Android/Web app for farmer-side access.
- 🔔 Alert notifications for expired crates.
- 📊 Analytics dashboard with trends and reporting.

---

> 💡 *This project shows how IoT, Java backend engineering, and real-time dashboards can combine to solve real-world problems in agriculture supply chains.*




