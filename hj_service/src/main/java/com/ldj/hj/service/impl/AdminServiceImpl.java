package com.ldj.hj.service.impl;

import com.ldj.hj.dao.AdminDao;
import com.ldj.hj.entity.Admin;
import com.ldj.hj.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public void addAdmin(Admin admin) {
        adminDao.insert(admin);
    }

    @Override
    public void removeAdmin(Integer adminId) {
        adminDao.delete(adminId);
    }

    @Override
    public void editAdmin(Admin admin) {
        adminDao.update(admin);
    }

    @Override
    public Admin getAdmin(Integer adminId) {
        return adminDao.selectByAdminId(adminId);
    }

    @Override
    public List<Admin> getAllAdmin() {
        return adminDao.selectAdminAll();
    }
}
