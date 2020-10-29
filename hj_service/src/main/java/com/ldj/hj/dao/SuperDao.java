package com.ldj.hj.dao;

import com.ldj.hj.entity.Super;
import org.springframework.stereotype.Repository;

@Repository("superDao")
public interface SuperDao {
    Super selectBySuperId(Integer superId);
    void update(Super superA);
}
