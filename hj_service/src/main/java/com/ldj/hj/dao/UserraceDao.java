package com.ldj.hj.dao;

import com.ldj.hj.entity.Userrace;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userraceDao")
public interface UserraceDao {
    void insert(Userrace userrace);
    void delete(Integer userraceId);
    void update(Userrace userrace);
    Userrace selectUserraceByUserraceId(Integer userraceId);
    List<Userrace> selectUserraceByRaceId(Integer raceId);
    List<Userrace> selectUserraceByUserId(Integer userId);
    List<Userrace> selectUserraceAll();
}
