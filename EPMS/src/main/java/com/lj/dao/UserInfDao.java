package com.lj.dao;

import com.lj.domain.User_inf;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserInfDao {
    //验证登陆,传入多个参数时，需要用@Param注解，否则不识别
    //@Select("select * from user_inf where login_name=#{login_name} and password=#{password}")
    User_inf login(@Param("login_name")String login_name, @Param("password")String password);
    //通过名字查询用户信息
     User_inf findByUserName(String login_name);
     User_inf queryUserByName(String name);
    //查询所有用户
    List<User_inf> findAll( @Param(value="nameSearch")String nameSearch);
    //查询所有用户
    List<User_inf> findAll();
    //参数名可以不一致
    User_inf findOne(Integer uid);

    void deleteById(Integer id);

    void update(User_inf userInf);

    void add(User_inf userInf);
}
