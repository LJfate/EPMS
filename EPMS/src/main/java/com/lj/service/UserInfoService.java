package com.lj.service;

import com.lj.domain.Employee;
import com.lj.domain.User_inf;

import java.util.List;

public interface UserInfoService  {
    User_inf login(String login_name, String password);

    List<User_inf> findAll(int page, int size, String nameSearch);
    List<User_inf> findAll(int page, int size );
    User_inf findOne(Integer uid);

    void deleteById(Integer id);

    void update(User_inf userInf);

    void add(User_inf userInf);
    //删除选中的用户信息
    void delSelectedUser(String[] uids);
    //测试
    User_inf findByName(String login_name);
}
