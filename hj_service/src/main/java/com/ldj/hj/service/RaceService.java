package com.ldj.hj.service;

import com.ldj.hj.entity.Race;

import java.util.List;

public interface RaceService {
    void addRace(Race race);
    void removeRace(Integer raceId);
    void editRace(Race race);
    void editLock(Integer raceId);
    void editUnlock(Integer raceId);
    Race getRace(Integer raceId);
    List<Race> getAllRaceByAdmin(Integer adminId);
    List<Race> getAllRaceByAdminNoLock(Integer adminId);
    List<Race> getAllRace();
}
