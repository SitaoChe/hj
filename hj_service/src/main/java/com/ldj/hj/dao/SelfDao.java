package com.ldj.hj.dao;

import com.ldj.hj.entity.Admin;
import com.ldj.hj.entity.Bmd;
import com.ldj.hj.entity.Super;
import com.ldj.hj.entity.User;
import org.springframework.stereotype.Repository;

@Repository("selfDao")
public interface SelfDao {
    Super selectBySuperAccount(String superAccount);
    Admin selectByAdminAccount(String adminAccount);
    Bmd selectByBmdAccount(String bmdAccount);
    User selectByUserAccount(String userAccount);
}
