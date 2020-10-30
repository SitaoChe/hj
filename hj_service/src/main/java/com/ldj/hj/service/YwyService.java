package com.ldj.hj.service;

import com.ldj.hj.entity.Ywy;

import java.util.List;

public interface YwyService {
    void addYwy(Ywy ywy);
    void removeYwy(Integer ywyId);
    void editYwy(Ywy ywy);
    Ywy getYwy(Integer ywyId);
    List<Ywy> getAllYwy();
}
