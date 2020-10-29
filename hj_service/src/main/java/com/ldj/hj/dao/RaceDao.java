package com.ldj.hj.dao;

import com.ldj.hj.entity.Race;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("raceDao")
public interface RaceDao {
    void insert(Race race);
    void delete(Integer raceId);
    void update(Race race);
    void updateLock(Integer raceId);
    void updateUnlock(Integer raceId);
    Race selectByRaceId(Integer raceId);
    List<Race> selectRaceByAdminId(Integer adminId);
    List<Race> selectRaceByAdminIdNoLock(Integer adminId);
    List<Race> selectRaceAll();
    Race selectRaceByRaceProject(String raceProject);
}
