package com.ldj.hj.entity;

import java.io.Serializable;

public class Userrace implements Serializable {
    private Integer userraceId;
    private Integer userId;
    private Integer raceId;
    private String grade;
    private User user;
    private Race race;

    public Integer getUserraceId() {
        return userraceId;
    }

    public void setUserraceId(Integer userraceId) {
        this.userraceId = userraceId;
    }
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRaceId() {
        return raceId;
    }

    public void setRaceId(Integer raceId) {
        this.raceId = raceId;
    }


    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Race getRace() {
        return race;
    }

    public void setRace(Race race) {
        this.race = race;
    }
}
