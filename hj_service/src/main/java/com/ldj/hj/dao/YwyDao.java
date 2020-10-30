package com.ldj.hj.dao;

import com.ldj.hj.entity.Ywy;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ywyDao")
public interface YwyDao {
    void insert(Ywy ywy);
    void delete(Integer ywyId);
    void update(Ywy ywy);
    Ywy selectByYwyId(Integer ywyId);
    List<Ywy> selectYwyAll();
}
