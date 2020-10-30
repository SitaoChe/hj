package com.ldj.hj.entity;

import java.io.Serializable;

public class User implements Serializable {
    private Integer userId;
    private String userAccount;
    private String userPwd;
    private String boyName;
    private String girlName;
    private String userIdCard;
    private String raceProject;
    private String phone;
    private String region;
    private String checkStatus;
    private Integer adminId;
    private Integer bmdId;
    private Bmd bmd;
    private String deleteStatus;
    private String grade;
    private Integer raceId;
    private Integer groupsNum;

    public Integer getGroupsNum() {
        return groupsNum;
    }

    public void setGroupsNum(Integer groupsNum) {
        this.groupsNum = groupsNum;
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

    public String getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(String deleteStatus) {
        this.deleteStatus = deleteStatus;
    }

    public String getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(String checkStatus) {
        this.checkStatus = checkStatus;
    }
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getBoyName() {
        return boyName;
    }

    public void setBoyName(String boyName) {
        this.boyName = boyName;
    }

    public String getGirlName() {
        return girlName;
    }

    public void setGirlName(String girlName) {
        this.girlName = girlName;
    }

    public String getUserIdCard() {
        return userIdCard;
    }

    public void setUserIdCard(String userIdCard) {
        this.userIdCard = userIdCard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRaceProject() {
        return raceProject;
    }

    public void setRaceProject(String raceProject) {
        this.raceProject = raceProject;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getBmdId() {
        return bmdId;
    }

    public void setBmdId(Integer bmdId) {
        this.bmdId = bmdId;
    }

    public Bmd getBmd() {
        return bmd;
    }

    public void setBmd(Bmd bmd) {
        this.bmd = bmd;
    }
}
