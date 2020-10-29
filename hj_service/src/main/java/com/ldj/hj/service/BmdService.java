package com.ldj.hj.service;

import com.ldj.hj.entity.Bmd;

import java.util.List;

public interface BmdService {
    void addBmd(Bmd bmd);
    void removeBmd(Integer bmdId);
    void editBmd(Bmd bmd);
    Bmd getBmd(Integer bmdId);
    Integer getNumByBmdId(Integer bmdId,boolean isOrder); //
    double getMoneyByBmdId(Integer bmdId,boolean isPay);
    List<Bmd> getAllBmd(Integer adminId);
}
