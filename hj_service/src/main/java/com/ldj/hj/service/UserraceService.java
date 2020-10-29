package com.ldj.hj.service;

import com.ldj.hj.entity.Userrace;

import java.util.List;

public interface UserraceService {
    void addUserrace(Userrace userrace);
    void removeUserrace(Integer userraceId);
    void editUserrace(Userrace userrace);
    Userrace getUserrace(Integer userraceId);
    List<Userrace> getUserraceByRaceId(Integer raceId);
    List<Userrace> getUserraceByUserId(Integer userId);
    List<Userrace> getUserraceAll();

}
