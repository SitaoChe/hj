package com.ldj.hj.service;

import com.ldj.hj.entity.User;

import java.util.List;

public interface UserService {
    void addUser(User user);
    void removeUser(Integer userId);
    void editUser(User user);
    void editDeleteStatus(Integer userId);
    User getUser(Integer userId);
    User getUserByUserIdCardAndRaceProject(User user);
    List<User> getUserByDeleteAndRace(String raceProject);
    List<User> getUserByDeleteAndBmdId(Integer bmdId);
    List<User> getUserByDeleteAndAdminId(Integer adminId);
    List<User> getAllUserByBmd(Integer bmdId);
    List<User> getAllUserByDelete();
    List<User> getAllUser();
    void updateUsersList(List<User> userList);
}
