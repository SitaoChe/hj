package com.ldj.hj.service.impl;

import com.ldj.hj.dao.YwyDao;
import com.ldj.hj.entity.Ywy;
import com.ldj.hj.service.YwyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ywyService")
public class YwyServiceImpl implements YwyService {

    @Qualifier("ywyDao")
    @Autowired
    private YwyDao ywyDao;


    public void addYwy(Ywy ywy) {
        ywyDao.insert(ywy);
    }


    public void removeYwy(Integer ywyId) {
        ywyDao.delete(ywyId);
    }


    public void editYwy(Ywy ywy) {
        ywyDao.update(ywy);
    }


    public Ywy getYwy(Integer ywyId) {
        return ywyDao.selectByYwyId(ywyId);
    }


    public List<Ywy> getAllYwy() {
        return ywyDao.selectYwyAll();
    }
}
