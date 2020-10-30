package com.ldj.hj.service;

import com.ldj.hj.entity.*;

public interface SelfService {
    Super superLogin(String superAccount,String superPwd);
    Admin adminLogin(String adminAccount,String adminPwd);
    Bmd bmdLogin(String bmdAccount,String bmdPwd);
    User userLogin(String userAccount,String userPwd);
    Ywy ywyLogin(String ywyAccount, String ywyPwd);

}
