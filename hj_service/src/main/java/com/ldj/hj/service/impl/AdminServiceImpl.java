package com.ldj.hj.service.impl;

import com.ldj.hj.dao.AdminDao;
import com.ldj.hj.entity.Admin;
import com.ldj.hj.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Qualifier("adminDao")
    @Autowired
    private AdminDao adminDao;


    public void addAdmin(Admin admin) {
        adminDao.insert(admin);
    }


    public void removeAdmin(Integer adminId) {
        adminDao.delete(adminId);
    }


    public void editAdmin(Admin admin) {
        adminDao.update(admin);
    }


    public Admin getAdmin(Integer adminId) {
        return adminDao.selectByAdminId(adminId);
    }

    
    public List<Admin> getAllAdmin() {
        return adminDao.selectAdminAll();
    }
}
