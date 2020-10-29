package com.ldj.hj.service.impl;

import com.ldj.hj.dao.SuperDao;
import com.ldj.hj.entity.Super;
import com.ldj.hj.service.SuperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("superService")
public class SuperServiceImpl implements SuperService {
    @Autowired
    private SuperDao superDao;

    @Override
    public void changeSuperPwd(Integer superId, String superPwd) {
        Super superA = superDao.selectBySuperId(superId);
        superA.setSuperPwd(superPwd);
        superDao.update(superA);
    }
}
