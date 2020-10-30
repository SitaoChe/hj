package com.ldj.hj.entity;

import java.io.Serializable;

public class Super implements Serializable {
    private Integer superId;
    private String superAccount;
    private String superPwd;

    public Integer getSuperId() {
        return superId;
    }

    public void setSuperId(Integer superId) {
        this.superId = superId;
    }

    public String getSuperAccount() {
        return superAccount;
    }

    public void setSuperAccount(String superAccount) {
        this.superAccount = superAccount;
    }

    public String getSuperPwd() {
        return superPwd;
    }

    public void setSuperPwd(String superPwd) {
        this.superPwd = superPwd;
    }
}
