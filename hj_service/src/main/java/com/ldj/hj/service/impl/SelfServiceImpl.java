package com.ldj.hj.service.impl;

import com.ldj.hj.dao.SelfDao;
import com.ldj.hj.entity.Admin;
import com.ldj.hj.entity.Bmd;
import com.ldj.hj.entity.Super;
import com.ldj.hj.entity.User;
import com.ldj.hj.service.SelfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("selfService")
public class SelfServiceImpl implements SelfService {
    @Autowired
    private SelfDao selfDao;

    @Override
    public Super superLogin(String superAccount, String superPwd) {
        Super superA = selfDao.selectBySuperAccount(superAccount);
        if (superA == null) return null;
        if (superA.getSuperPwd().equals(superPwd)) return superA;
        return null;
    }

    @Override
    public Admin adminLogin(String adminAccount, String adminPwd) {
        Admin admin = selfDao.selectByAdminAccount(adminAccount);
        if (admin == null) return null;
        if (admin.getAdminPwd().equals(adminPwd)) return admin;
        return null;
    }

    @Override
    public Bmd bmdLogin(String bmdAccount, String bmdPwd) {
        Bmd bmd = selfDao.selectByBmdAccount(bmdAccount);
        if (bmd == null) return null;
        if (bmd.getBmdPwd().equals(bmdPwd)) return bmd;
        return null;
    }

    @Override
    public User userLogin(String userAccount, String userPwd) {
        User user = selfDao.selectByUserAccount(userAccount);
        if (user == null) return null;
        if (user.getUserPwd().equals(userPwd)) return user;
        return null;
    }
}
