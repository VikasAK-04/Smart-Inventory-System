package com.Hackathon.Hackathon.model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Tomato {
    private String tagId;
    private String name;
    private double weight;
    private int freshnessDays;
    private LocalDate dateScanned;
    private long id;

    // Constructor used when reading full DB record
    public Tomato(String tagId, String name, double weight, int freshnessDays, LocalDate dateScanned) {
        this.tagId = tagId;
        this.name = name;
        this.weight = weight;
        this.freshnessDays = freshnessDays;
        this.dateScanned = dateScanned;
    }

    // Constructor for manual entry
    public Tomato(String tagId, int freshnessDays) {
        this.tagId = tagId;
        this.freshnessDays = freshnessDays;
        this.dateScanned = LocalDate.now();
    }

    // Calculate remaining freshness days
    public int getDaysLeft() {
        long daysPassed = ChronoUnit.DAYS.between(dateScanned, LocalDate.now());
        return freshnessDays - (int) daysPassed;
    }

    // Check if tomato is expired
    public boolean isExpired() {
        return getDaysLeft() <= 0;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTagId() {
        return tagId;
    }

    public String getName() {
        return name;
    }

    public double getWeight() {
        return weight;
    }

    public int getFreshnessDays() {
        return freshnessDays;
    }

    public LocalDate getDateScanned() {
        return dateScanned;
    }

    // Optional setters if needed
    public void setDateScanned(LocalDate dateScanned) {
        this.dateScanned = dateScanned;
    }
}