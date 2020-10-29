package com.ldj.hj.dao;

import com.ldj.hj.entity.Bmd;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bmdDao")
public interface BmdDao {
    void insert(Bmd bmd);
    void delete(Integer bmdId);
    void update(Bmd bmd);
    Bmd selectByBmdId(Integer bmdId);
    List<Bmd> selectBmdAll(Integer adminId);

}
