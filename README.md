# 🍅 Smart Tomato Inventory System: Real-Time Tracking & Management

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white)](https://spring.io/projects/spring-boot)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![ESP32](https://img.shields.io/badge/ESP32-E7352C?style=for-the-badge&logo=espressif&logoColor=white)](https://www.espressif.com/en/products/socs/esp32)
[![Leaflet.js](https://img.shields.io/badge/Leaflet.js-1C9766?style=for-the-badge&logo=leaflet&logoColor=white)](https://leafletjs.com/)

A comprehensive full-stack IoT and software solution designed for **real-time tracking and intelligent management of tomato crates**. This project leverages **ESP32** microcontrollers, **RFID** technology, and **OLED** displays for data acquisition, a robust **Spring Boot** backend with **PostgreSQL** for data handling, and a dynamic **JSP web dashboard** featuring interactive maps powered by **Leaflet.js** for intuitive visualization.

This system aims to revolutionize traditional inventory practices by providing accurate, real-time data, significantly reducing spoilage, and enhancing transparency across the supply chain for intermediaries, warehouses, and farmers.

---

## ✨ Key Features

* **Individual Crate Tracking:** Utilize unique RFID tags for precise identification and tracking of each tomato crate.
* **Real-time Data Acquisition:** ESP32 microcontrollers read RFID data and transmit it to the backend instantly via HTTP over Wi-Fi.
* **On-Device Feedback:** Integrated OLED screens on ESP32 devices display scanned tag information in real-time, providing immediate confirmation.
* **Dynamic Web Dashboard:** A JSP-based web interface offers a centralized view of all crate locations, freshness status, and critical alerts.
* **Automated Spoilage Detection:** Intelligent algorithms automatically detect and flag expired tomato crates based on harvest timestamps and predefined shelf-life criteria.
* **Robust Data Management:** PostgreSQL database ensures reliable, scalable, and secure storage for all inventory data.
* **API Integration:** RESTful APIs facilitate seamless integration with other logistics, ERP, or supply chain management systems.
* **Clean Architecture:** Built with a maintainable MVC (Model-View-Controller) architecture for the Spring Boot backend.

---

## 🏛️ Architecture Overview

The system is designed with distinct layers that communicate efficiently to provide a robust and scalable solution:
