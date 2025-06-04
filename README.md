# 🍅 Smart Tomato Inventory System using Spring Boot + ESP32 + RFID + OLED

A full-stack IoT + software solution for tracking tomato crates in real-time using **ESP32**, **RFID**, and a **Spring Boot + PostgreSQL backend**, with a dynamic web dashboard powered by **JSP** and **Leaflet Maps**.

This project aims to improve inventory tracking, reduce spoilage, and provide real-time data access for intermediaries, warehouses, and farmers.

---

##  Key Features

-  Track individual tomato crates using RFID tags.
-  ESP32 reads RFID data and sends it to Spring Boot backend via HTTP.
-  OLED screen displays tag info in real time.
-  JSP-based web dashboard shows crate locations and freshness.
-  Identifies expired tomatoes based on date.
-  PostgreSQL database stores and manages inventory data.
-  REST APIs for data integration with other systems.
-  Clean code structure with MVC design pattern in Spring Boot.

---

##  Architecture Overview

[ESP32 + RFID Reader + OLED]
           ↓ (WiFi HTTP POST)
     [Spring Boot REST API]
           ↓
     [PostgreSQL Database]
           ↓
      [JSP Web Dashboard]



 Technologies Used
Layer	Tech Stack
Frontend	JSP, HTML, CSS, Leaflet.js
Backend	Spring Boot, REST APIs
Database	PostgreSQL
Microcontroller	ESP32
Sensors	MFRC522 RFID Reader, OLED SSD1306
Libraries (ESP32)	WiFi, HTTPClient, MFRC522, Adafruit GFX



How It Works
ESP32 scans RFID tag using MFRC522 reader.

OLED display shows the scanned tag ID instantly.

ESP32 sends the tag data to the backend REST API over WiFi.

Spring Boot server receives the data, assigns unique tag ID, and stores it in PostgreSQL with a timestamp.

Web dashboard displays all crates, their status, and expiration data.


REST API Endpoints
Method	 Endpoint	     Description
POST	   /addTag	     Receive RFID tag from ESP32
GET	     /expired	     Fetch list of expired crates
GET	     /dashboard	   Load web dashboard (JSP)


Live Dashboard Preview
The dashboard displays:

Total crates scanned

Crates that are still fresh

Crates that are expired

Real-time map view (Leaflet)


<img width="952" alt="DashBoard " src="https://github.com/user-attachments/assets/c508456b-4e97-4ec2-8cb2-20662924e5e4" />


Developed by 
Vikas KA
June 2025 
IoT + Spring Boot + PostgreSQL Hackathon Project





