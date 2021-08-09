package com.lj.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
//员工表
public class Employee implements Serializable {
    private Integer emp_id;         //员工id
    private String emp_name;        //员工姓名
    private String sex;             //性别
    private Integer dep_id;
    //一对一关系映射
    private Department dep;
    private String post;         //职位
    private String post_title;   //职称
    private String identity_card;//身份证
    private String education;    //学历
    private String mobile;       //手机号
    private String birth;        //出生日期
    private String address;      //地址
    private  String login_name;  //登录名
    private String password;     //密码
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")//将页面的字符串转换为日期格式
    private Date dateintocompany;  //入职时间
    private String dateintocompanyStr;//从数据库中得不到的,用来获取dateintocompany字符串格式
    private SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");
    public String getDateintocompanyStr() {
        if(dateintocompany!=null){
            dateintocompanyStr = sdf.format(dateintocompany);
        }
        return dateintocompanyStr;
    }

    public Department getDep() {
        return dep;
    }

    public void setDep(Department dep) {
        this.dep = dep;
    }

    public Integer getDep_id() {
        return dep_id;
    }

    public void setDep_id(Integer dep_id) {
        this.dep_id = dep_id;
    }

    public SimpleDateFormat getSdf() {
        return sdf;
    }

    public void setSdf(SimpleDateFormat sdf) {
        this.sdf = sdf;
    }

    public Integer getemp_id() {
        return emp_id;
    }

    public void setemp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public String getemp_name() {
        return emp_name;
    }

    public void setemp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getIdentity_card() {
        return identity_card;
    }

    public void setIdentity_card(String identity_card) {
        this.identity_card = identity_card;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public Date getDateintocompany() {
        return  dateintocompany;
    }

    public void setDateintocompany(Date dateintocompany)   {
//        DateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
//        dateFormat.parse("10101201");
        this.dateintocompany = dateintocompany;
    }

}
