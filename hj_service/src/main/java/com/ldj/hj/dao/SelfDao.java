package com.ldj.hj.dao;

import com.ldj.hj.entity.*;
import org.springframework.stereotype.Repository;

@Repository("selfDao")
public interface SelfDao {
    Super selectBySuperAccount(String superAccount);
    Admin selectByAdminAccount(String adminAccount);
    Bmd selectByBmdAccount(String bmdAccount);
    User selectByUserAccount(String userAccount);
    Ywy selectByYwyAccount(String ywyAccount);
}
