package com.ldj.hj.service.impl;

import com.github.pagehelper.PageHelper;
import com.ldj.hj.dao.UserDao;
import com.ldj.hj.entity.User;
import com.ldj.hj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        userDao.insert(user);
    }

    @Override
    public void removeUser(Integer userId) {
        userDao.delete(userId);
    }

    @Override
    public void editUser(User user) {
        userDao.update(user);
    }

    @Override
    public void editDeleteStatus(Integer userId) {
        userDao.updataDelete(userId);
    }

    @Override
    public User getUser(Integer userId) {
        return userDao.selectByUserId(userId);
    }

    @Override
    public List<User> getUserByDeleteAndRace(String raceProject) {
        return userDao.selectUserByDeleteAndRace(raceProject);
    }

    @Override
    public List<User> getUserByDeleteAndBmdId(Integer bmdId) {
        return userDao.selectUserByDeleteAndBmdId(bmdId);
    }

    @Override
    public List<User> getUserByDeleteAndAdminId(Integer adminId) {
        return userDao.selectUserByDeleteAndAdminId(adminId);
    }

    @Override
    public List<User> getAllUserByBmd(Integer bmdId) {
        return userDao.selectUserByBmdId(bmdId);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.selectUserAll();
    }
}
