package com.ldj.hj.dao;

import com.ldj.hj.entity.User;
import com.ldj.hj.entity.Userrace;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public interface UserDao {
    void insert(User user);
    void delete(Integer userId);
    void update(User user);
    void updataDelete(Integer userId);
    User selectByUserId(Integer userId);
    Integer countUserByDeleteAndIdcard(Integer bmdId);
    User selectUserByUserIdCardAndRaceProject(User user);
    List<User> selectUserByBmdIdAndOtherCondition(User user);
    List<User> selectUserByDeleteAndRace(String raceProject);
    List<User> selectUserByDeleteAndBmdId(Integer bmdId);
    List<User> selectUserByDeleteAndAdminId(Integer adminId);
    List<User> selectUserByRaceProject(String raceAllName);
    List<User> selectUserByBmdId(Integer bmdId);
    List<User> selectUserAll();
    List<User> getAllUserByDelete();
    void updateUsersList(List<User> userList);
}
