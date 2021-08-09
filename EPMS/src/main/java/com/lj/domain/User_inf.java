package com.lj.domain;

import jdk.net.SocketFlow;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;

//用户登录信息表
public class User_inf implements Serializable {
    private Integer id;
    private String username;    //用户名
    private String password;    //密码
    private String login_name;  //登陆名
//    private  Status status;     //一对一,表与表的对应关系
//    private String email;
//    private Integer per_id;     //关联员工信息，目的是为了得到员工id
//    private Integer identity;  //身份，1：管理员 2：员工
//    private Date createDate;    //从数据库得到日期
//    private String createTimeStr;//从数据库中得不到的
//    private SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }
}
