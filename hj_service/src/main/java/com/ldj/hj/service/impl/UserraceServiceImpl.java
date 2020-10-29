package com.ldj.hj.service.impl;

import com.ldj.hj.dao.UserraceDao;
import com.ldj.hj.entity.Userrace;
import com.ldj.hj.service.UserraceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userraceService")
public class UserraceServiceImpl implements UserraceService {
    @Autowired
    private UserraceDao userraceDao;


    @Override
    public void addUserrace(Userrace userrace) {
        userraceDao.insert(userrace);
    }

    @Override
    public void removeUserrace(Integer userraceId) {
        userraceDao.delete(userraceId);
    }

    @Override
    public void editUserrace(Userrace userrace) {
        userraceDao.update(userrace);
    }

    @Override
    public Userrace getUserrace(Integer userraceId) {
        return userraceDao.selectUserraceByUserraceId(userraceId);
    }

    @Override
    public List<Userrace> getUserraceByRaceId(Integer raceId) {
        return userraceDao.selectUserraceByRaceId(raceId);
    }

    @Override
    public List<Userrace> getUserraceByUserId(Integer userId) {
        return userraceDao.selectUserraceByUserId(userId);
    }

    @Override
    public List<Userrace> getUserraceAll() {
        return userraceDao.selectUserraceAll();
    }
}
