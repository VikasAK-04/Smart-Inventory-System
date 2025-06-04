package com.Hackathon.Hackathon.service;

import com.Hackathon.Hackathon.model.Tomato;
import com.Hackathon.Hackathon.util.DBConnection;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class TomatoService {

    // Generate random tag ID (12 characters)
    private String generateRandomTagId() {
        return UUID.randomUUID().toString().replace("-", "").substring(0, 12);
    }

    // Generate random name
    private String generateRandomName() {
        return "Tomato-" + UUID.randomUUID().toString().substring(0, 8);
    }

    // Generate random weight between 100g and 500g
    private double generateRandomWeight() {
        return ThreadLocalRandom.current().nextDouble(100.0, 500.0);
    }

    // Add tomato via RFID scan (used by /scan and /api/scan)
    public void scanTomato(int freshnessDays) {
        String tagId = generateRandomTagId();
        String name = generateRandomName();
        double weight = generateRandomWeight();

        try (Connection conn = DBConnection.getConnection()) {
            String insertSql = "INSERT INTO tomatoes (tag_id, name, weight, freshness_days, date_scanned) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, tagId);
            insertStmt.setString(2, name);
            insertStmt.setDouble(3, weight);
            insertStmt.setInt(4, freshnessDays);
            insertStmt.setDate(5, Date.valueOf(LocalDate.now()));
            insertStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Add tomato manually via UI form
    public void addManualTomato(int freshnessDays) {
        String tagId = generateRandomTagId();
        String name = generateRandomName();
        double weight = generateRandomWeight();

        try (Connection conn = DBConnection.getConnection()) {
            String insertSql = "INSERT INTO tomatoes (tag_id, name, weight, freshness_days, date_scanned) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, tagId);
            insertStmt.setString(2, name);
            insertStmt.setDouble(3, weight);
            insertStmt.setInt(4, freshnessDays);
            insertStmt.setDate(5, Date.valueOf(LocalDate.now()));
            insertStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // List all tomatoes
    public List<Tomato> getAllTomatoes() {
        List<Tomato> tomatoes = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT tag_id, name, weight, freshness_days, date_scanned FROM tomatoes";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                String tagId = rs.getString("tag_id");
                String name = rs.getString("name");
                double weight = rs.getDouble("weight");
                int freshness = rs.getInt("freshness_days");
                LocalDate scannedDate = rs.getDate("date_scanned").toLocalDate();

                Tomato tomato = new Tomato(tagId, freshness);
                try {
                    var field = tomato.getClass().getDeclaredField("dateScanned");
                    field.setAccessible(true);
                    field.set(tomato, scannedDate);
                } catch (NoSuchFieldException | IllegalAccessException e) {
                    e.printStackTrace();
                }

                tomatoes.add(tomato);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tomatoes;
    }

    // Filter expired tomatoes only
    public List<Tomato> getExpiredTomatoes() {
        List<Tomato> expired = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT tag_id, name, weight, freshness_days, date_scanned FROM tomatoes";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                String tagId = rs.getString("tag_id");
                String name = rs.getString("name");
                double weight = rs.getDouble("weight");
                int freshness = rs.getInt("freshness_days");
                LocalDate scannedDate = rs.getDate("date_scanned").toLocalDate();

                Tomato tomato = new Tomato(tagId, freshness);
                try {
                    var field = tomato.getClass().getDeclaredField("dateScanned");
                    field.setAccessible(true);
                    field.set(tomato, scannedDate);
                } catch (NoSuchFieldException | IllegalAccessException e) {
                    e.printStackTrace();
                }

                if (tomato.isExpired()) {
                    expired.add(tomato);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return expired;
    }
}
