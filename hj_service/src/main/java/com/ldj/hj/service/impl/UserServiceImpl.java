package com.ldj.hj.service.impl;

import com.github.pagehelper.PageHelper;
import com.ldj.hj.dao.UserDao;
import com.ldj.hj.entity.User;
import com.ldj.hj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("userService")
public class UserServiceImpl implements UserService {
    @Qualifier("userDao")
    @Autowired
    private UserDao userDao;


    public void addUser(User user) {
        userDao.insert(user);
    }


    public void removeUser(Integer userId) {
        userDao.delete(userId);
    }


    public void editUser(User user) {
        userDao.update(user);
    }


    public void editDeleteStatus(Integer userId) {
        userDao.updataDelete(userId);
    }


    public User getUser(Integer userId) {
        return userDao.selectByUserId(userId);
    }

    public User getUserByUserIdCardAndRaceProject(User user) {
        return userDao.selectUserByUserIdCardAndRaceProject(user);
    }


    public List<User> getUserByDeleteAndRace(String raceProject) {
        return userDao.selectUserByDeleteAndRace(raceProject);
    }


    public List<User> getUserByDeleteAndBmdId(Integer bmdId) {
        return userDao.selectUserByDeleteAndBmdId(bmdId);
    }


    public List<User> getUserByDeleteAndAdminId(Integer adminId) {
        return userDao.selectUserByDeleteAndAdminId(adminId);
    }


    public List<User> getAllUserByBmd(Integer bmdId) {
        return userDao.selectUserByBmdId(bmdId);
    }

    public List<User> getAllUserByDelete() {
        return userDao.getAllUserByDelete();
    }


    public List<User> getAllUser() {
        return userDao.selectUserAll();
    }

    public void updateUsersList(List<User> userList) {
        userDao.updateUsersList(userList);
    }
}
