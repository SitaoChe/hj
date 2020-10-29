package com.ldj.hj.dao;

import com.ldj.hj.entity.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminDao")
public interface AdminDao {
    void insert(Admin admin);
    void delete(Integer adminId);
    void update(Admin admin);
    Admin selectByAdminId(Integer adminId);
    List<Admin> selectAdminAll();
}
