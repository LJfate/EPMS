package com.lj.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**考勤信息表
 *从表
 */
public class Attendance {

    //考勤id
    private  Integer att_id;
    //员工id
    private  Integer emp_id;
    //日期
    @JsonFormat(pattern = "yyyy-MM-dd")//将数据库的日期格式转换为符合前端标准的日期格式
    @DateTimeFormat(pattern="yyyy-MM-dd")//将页面的时间字符串转换为符合标准的数据库的日期格式
    private  Date att_date;
    //上班时间
    @DateTimeFormat(pattern="HH:mm:ss")
    private Date att_shangban;
    //下班时间
    @DateTimeFormat(pattern="HH:mm:ss")
    private Date att_xiaban;
    //类型
    private  Integer att_type;
    //一对一映射
    private Employee employee;
    //备注
    private String att_intro;
    private String att_dateStr;//从数据库中得不到的,用来获取att_date字符串格式
    private String att_shangbanStr;//从数据库中得不到的,用来获取att_shangban字符串格式
    private String att_xiabanStr;//从数据库中得不到的,用来获取att_xiaban字符串格式
    private SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd ");
    private SimpleDateFormat sdf1= new SimpleDateFormat("HH:mm:ss");

    public String getAtt_dateStr() {
        if(att_date!=null){
            att_dateStr = sdf.format(att_date);
        }
        return att_dateStr;
    }

    public String getAtt_shangbanStr() {
        if(att_shangban!=null){
            att_shangbanStr = sdf1.format(att_shangban);
        }
        return att_shangbanStr;
    }

    public String getAtt_xiabanStr() {
        if(att_xiaban!=null){
            att_xiabanStr = sdf1.format(att_xiaban);
        }
        return att_xiabanStr;
    }

    public Date getAtt_shangban() {
        return att_shangban;
    }

    public void setAtt_shangban(Date att_shangban) {
        this.att_shangban = att_shangban;
    }

    public Date getAtt_xiaban() {
        return att_xiaban;
    }

    public void setAtt_xiaban(Date att_xiaban) {
        this.att_xiaban = att_xiaban;
    }

    public Integer getAtt_id() {
        return att_id;
    }

    public void setAtt_id(Integer att_id) {
        this.att_id = att_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Date getAtt_date() {
        return att_date;
    }

    public void setAtt_date(Date att_date) {
        this.att_date = att_date;
    }





    public Integer getAtt_type() {
        return att_type;
    }

    public void setAtt_type(Integer att_type) {
        this.att_type = att_type;
    }

    public String getAtt_intro() {
        return att_intro;
    }

    public void setAtt_intro(String att_intro) {
        this.att_intro = att_intro;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}

