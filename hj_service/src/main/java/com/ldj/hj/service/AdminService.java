package com.ldj.hj.service;

import com.ldj.hj.entity.Admin;

import java.util.List;

public interface AdminService {
    void addAdmin(Admin admin);
    void removeAdmin(Integer adminId);
    void editAdmin(Admin admin);
    Admin getAdmin(Integer adminId);
    List<Admin> getAllAdmin();

}
