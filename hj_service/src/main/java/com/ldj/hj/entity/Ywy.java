package com.ldj.hj.entity;

import java.io.Serializable;

public class Ywy implements Serializable {
    private Integer ywyId;
    private String ywyAccount;
    private String ywyPwd;
    private String ywyName;
    private String idCard;
    private String phone;

    public String getYwyName() {
        return ywyName;
    }

    public void setYwyName(String ywyName) {
        this.ywyName = ywyName;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getYwyId() {
        return ywyId;
    }

    public void setYwyId(Integer ywyId) {
        this.ywyId = ywyId;
    }

    public String getYwyAccount() {
        return ywyAccount;
    }

    public void setYwyAccount(String ywyAccount) {
        this.ywyAccount = ywyAccount;
    }

    public String getYwyPwd() {
        return ywyPwd;
    }

    public void setYwyPwd(String ywyPwd) {
        this.ywyPwd = ywyPwd;
    }
}
