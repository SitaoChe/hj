package com.ldj.hj.service.impl;

import com.ldj.hj.dao.UserraceDao;
import com.ldj.hj.entity.Userrace;
import com.ldj.hj.service.UserraceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userraceService")
public class UserraceServiceImpl implements UserraceService {
    @Qualifier("userraceDao")
    @Autowired
    private UserraceDao userraceDao;



    public void addUserrace(Userrace userrace) {
        userraceDao.insert(userrace);
    }


    public void removeUserrace(Integer userraceId) {
        userraceDao.delete(userraceId);
    }


    public void editUserrace(Userrace userrace) {
        userraceDao.update(userrace);
    }


    public Userrace getUserrace(Integer userraceId) {
        return userraceDao.selectUserraceByUserraceId(userraceId);
    }


    public List<Userrace> getUserraceByRaceId(Integer raceId) {
        return userraceDao.selectUserraceByRaceId(raceId);
    }


    public List<Userrace> getUserraceByUserId(Integer userId) {
        return userraceDao.selectUserraceByUserId(userId);
    }


    public List<Userrace> getUserraceAll() {
        return userraceDao.selectUserraceAll();
    }
}
