package com.ldj.hj.service.impl;

import com.ldj.hj.dao.BmdDao;
import com.ldj.hj.dao.RaceDao;
import com.ldj.hj.dao.UserDao;
import com.ldj.hj.entity.Bmd;
import com.ldj.hj.entity.Race;
import com.ldj.hj.entity.User;
import com.ldj.hj.service.BmdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bmdService")
public class BmdServiceImpl implements BmdService {
    @Qualifier("bmdDao")
    @Autowired
    private BmdDao bmdDao;
    @Qualifier("raceDao")
    @Autowired
    private RaceDao raceDao;
    @Qualifier("userDao")
    @Autowired
    private UserDao userDao;


    public void addBmd(Bmd bmd) {
        bmdDao.insert(bmd);
    }


    public void removeBmd(Integer bmdId) {
        List<User> userList = userDao.selectUserByBmdId(bmdId);
        for(User user:userList){
            userDao.updataDelete(user.getUserId());
        }
        bmdDao.delete(bmdId);
    }


    public void editBmd(Bmd bmd) {
        bmdDao.update(bmd);
    }


    public Bmd getBmd(Integer bmdId) {
        return bmdDao.selectByBmdId(bmdId);
    }


    public Integer getNumByBmdId(Integer bmdId, boolean isOrder) {
        List<User> userList = userDao.selectUserByDeleteAndBmdId(bmdId);
        if(isOrder) return userList.size();
        else{
           Integer perNum =  userDao.countUserByDeleteAndIdcard(bmdId);
            return perNum;
        }
    }


    public double getMoneyByBmdId(Integer bmdId, boolean isPay) {
        double bmdMoney = 0.0;
        User user = new User();
        user.setBmdId(bmdId);
        user.setDeleteStatus("未删除");
        List<User> userList = null;
        if(isPay){
            user.setCheckStatus("已缴费");
            userList =  userDao.selectUserByBmdIdAndOtherCondition(user);
        }else {
            userList = userDao.selectUserByBmdIdAndOtherCondition(user);
        }
        for(User u : userList){
            Integer raceId = u.getRaceId();
            Race race = raceDao.selectByRaceId(raceId);
            double money =(race== null? 0.0:race.getMoney() == null?0.0:Double.parseDouble(race.getMoney()));
            bmdMoney += money;
        }
        return bmdMoney;
    }


    public List<Bmd> getAllBmd(Integer adminId) {
        return bmdDao.selectBmdAll(adminId);
    }
}
