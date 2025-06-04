# 🍅 Smart Tomato Inventory System

A full-stack IoT and software solution for **real-time tracking of tomato crates** using **ESP32**, **RFID**, and **OLED**, with a backend built on **Spring Boot** and **PostgreSQL**, and a dynamic **JSP web dashboard** featuring interactive maps powered by **Leaflet.js**.

This project aims to improve inventory management, reduce spoilage, and provide transparent, real-time data access to intermediaries, warehouses, and farmers.

---

## Key Features

- Track individual tomato crates using RFID tags.
- ESP32 reads RFID data and sends it to the backend via HTTP.
- OLED screen displays tag info in real time on the ESP32 device.
- JSP-based web dashboard visualizes crate locations and freshness status.
- Automatic detection of expired tomato crates based on timestamps.
- PostgreSQL database for reliable inventory data storage and management.
- REST APIs to facilitate integration with other systems.
- Clean MVC architecture for maintainable Spring Boot backend.

---

## Architecture Overview

[ESP32 + RFID Reader + OLED]
↓ (WiFi HTTP POST)
[Spring Boot REST API]
↓
[PostgreSQL Database]
↓
[JSP Web Dashboard]



---

## Technologies Used

| Layer          | Technology Stack                              |
|----------------|----------------------------------------------|
| Frontend       | JSP, HTML, CSS, Leaflet.js                    |
| Backend        | Spring Boot, REST APIs                        |
| Database       | PostgreSQL                                   |
| Microcontroller| ESP32                                        |
| Sensors        | MFRC522 RFID Reader, OLED SSD1306             |
| ESP32 Libraries| WiFi, HTTPClient, MFRC522, Adafruit GFX      |

---

## How It Works

1. ESP32 scans an RFID tag using the MFRC522 reader.  
2. The OLED displays the scanned tag ID instantly.  
3. ESP32 sends the tag data to the Spring Boot backend REST API over WiFi.  
4. The backend assigns a unique tag ID, stores the data with timestamps in PostgreSQL.  
5. The JSP dashboard shows all crates with status, location, and expiration info in real time.

---

## REST API Endpoints

| Method | Endpoint     | Description                   |
|--------|--------------|------------------------------|
| POST   | `/addTag`    | Receive RFID tag data from ESP32 |
| GET    | `/expired`   | Fetch list of expired crates      |
| GET    | `/dashboard` | Load the web dashboard (JSP)     |

---

## Live Dashboard Preview

The dashboard provides:

- Total crates scanned  
- Number of fresh crates  
- Number of expired crates  
- Real-time interactive map view with Leaflet.js  

![Dashboard Preview](https://github.com/user-attachments/assets/c508456b-4e97-4ec2-8cb2-20662924e5e4)

---

## Developed By

**Vikas KA**  
June 2025  
IoT + Spring Boot + PostgreSQL Hackathon Project
