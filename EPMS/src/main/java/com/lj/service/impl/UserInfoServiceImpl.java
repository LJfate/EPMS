package com.lj.service.impl;

import com.github.pagehelper.PageHelper;
import com.lj.dao.UserInfDao;
import com.lj.domain.Employee;
import com.lj.domain.User_inf;
import com.lj.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class UserInfoServiceImpl implements UserInfoService ,Serializable {
    @Autowired
    UserInfDao userInfoDao;
    @Override
    public User_inf login(String loginname, String password) {

      return   userInfoDao.login(loginname,password);
    }


    @Override
    public List<User_inf> findAll(int page, int size, String nameSearch) {
        PageHelper.startPage(page,size);
        List<User_inf> userInfs = userInfoDao.findAll( nameSearch);
        return userInfs;
    }

    @Override
    public List<User_inf> findAll(int page, int size) {
        PageHelper.startPage(page,size);
        List<User_inf> userInfs = userInfoDao.findAll();
        return userInfs;
    }

    @Override
    public User_inf findOne(Integer uid) { return userInfoDao.findOne(uid); }

    @Override
    public void deleteById(Integer id) { userInfoDao.deleteById(id); }

    @Override
    public void update(User_inf userInf) { userInfoDao.update(userInf); }

    @Override
    public void add(User_inf userInf) { userInfoDao.add(userInf);}

    @Override
    public void delSelectedUser(String[] uids) {
        for (String uid:uids
             ) {
            userInfoDao.deleteById(Integer.parseInt(uid));
        }
    }

    @Override
    public User_inf findByName(String login_name) {
        return userInfoDao.findByUserName(login_name);
    }
}
