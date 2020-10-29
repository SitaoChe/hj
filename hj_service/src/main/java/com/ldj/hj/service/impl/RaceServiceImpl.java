package com.ldj.hj.service.impl;

import com.ldj.hj.dao.RaceDao;
import com.ldj.hj.dao.UserDao;
import com.ldj.hj.entity.Race;
import com.ldj.hj.entity.User;
import com.ldj.hj.service.RaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("raceService")
public class RaceServiceImpl implements RaceService {
    @Autowired
    private RaceDao raceDao;
    @Autowired
    private UserDao userDao;

    @Override
    public void addRace(Race race) {
        raceDao.insert(race);
    }

    @Override
    public void removeRace(Integer raceId) {
        Race race = raceDao.selectByRaceId(raceId);
        String raceAllName = race.getRaceName() + "-(" + race.getStartAge() +"-" + race.getEndAge()+"岁)";
        List<User> userList= userDao.selectUserByRaceProject(raceAllName);
        for (User user : userList) {
            userDao.updataDelete(user.getUserId());
        }
        raceDao.delete(raceId);
    }

    @Override
    public void editRace(Race race) {
        raceDao.update(race);
    }

    @Override
    public void editLock(Integer raceId) {
        raceDao.updateLock(raceId);
    }

    @Override
    public void editUnlock(Integer raceId) {
        raceDao.updateUnlock(raceId);
    }

    @Override
    public Race getRace(Integer raceId) {
        return raceDao.selectByRaceId(raceId);
    }

    @Override
    public List<Race> getAllRaceByAdmin(Integer adminId) {
        return raceDao.selectRaceByAdminId(adminId);
    }

    @Override
    public List<Race> getAllRaceByAdminNoLock(Integer adminId) {
        return raceDao.selectRaceByAdminIdNoLock(adminId);
    }

    @Override
    public List<Race> getAllRace() {
        return raceDao.selectRaceAll();
    }
}
