package com.ldj.hj.service;

import com.ldj.hj.entity.Admin;
import com.ldj.hj.entity.Bmd;
import com.ldj.hj.entity.Super;
import com.ldj.hj.entity.User;

public interface SelfService {
    Super superLogin(String superAccount,String superPwd);
    Admin adminLogin(String adminAccount,String adminPwd);
    Bmd bmdLogin(String bmdAccount,String bmdPwd);
    User userLogin(String userAccount,String userPwd);
}
