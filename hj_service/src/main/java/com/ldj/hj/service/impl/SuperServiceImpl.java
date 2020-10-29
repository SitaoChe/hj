package com.ldj.hj.service.impl;

import com.ldj.hj.dao.SuperDao;
import com.ldj.hj.entity.Super;
import com.ldj.hj.service.SuperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("superService")
public class SuperServiceImpl implements SuperService {

    @Qualifier("superDao")
    @Autowired
    private SuperDao superDao;

    
    public void changeSuperPwd(Integer superId, String superPwd) {
        Super superA = superDao.selectBySuperId(superId);
        superA.setSuperPwd(superPwd);
        superDao.update(superA);
    }
}
