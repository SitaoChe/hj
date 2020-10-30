package com.ldj.hj.entity;

import java.io.Serializable;

public class Race implements Serializable {
    private Integer raceId;
    private String raceName;
    private String startAge;
    private String endAge;
    private String startTime;
    private String endTime;
    private String startRace;
    private String money;
    private String lockStatus;
    private Integer adminId;
    private String raceType;
    private String danceType;
    private Admin admin;

    public String getRaceType() {
        return raceType;
    }

    public void setRaceType(String raceType) {
        this.raceType = raceType;
    }

    public String getDanceType() {
        return danceType;
    }

    public void setDanceType(String danceType) {
        this.danceType = danceType;
    }



    public Integer getRaceId() {
        return raceId;
    }

    public void setRaceId(Integer raceId) {
        this.raceId = raceId;
    }

    public String getRaceName() {
        return raceName;
    }

    public void setRaceName(String raceName) {
        this.raceName = raceName;
    }

    public String getStartAge() {
        return startAge;
    }

    public void setStartAge(String startAge) {
        this.startAge = startAge;
    }

    public String getEndAge() {
        return endAge;
    }

    public void setEndAge(String endAge) {
        this.endAge = endAge;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStartRace() {
        return startRace;
    }

    public void setStartRace(String startRace) {
        this.startRace = startRace;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getLockStatus() {
        return lockStatus;
    }

    public void setLockStatus(String lockStatus) {
        this.lockStatus = lockStatus;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
}
