package com.lj.domain;

import java.io.Serializable;
import java.util.Date;

//请假表
public class Vacate implements Serializable {
    private  Integer vacate_id;     //请假编号
    private  Integer pro_id;        //员工id
    private  String deparment;      //部门
    private String position;        //职务
    private Date vacate_starttime;  //请假开始时间
    private Date vacate_endtime;    //结束时间
    private String vacate_result;   //请假原因
    private String approver;        //批准人

    public Integer getVacate_id() {
        return vacate_id;
    }

    public void setVacate_id(Integer vacate_id) {
        this.vacate_id = vacate_id;
    }

    public Integer getPro_id() {
        return pro_id;
    }

    public void setPro_id(Integer pro_id) {
        this.pro_id = pro_id;
    }

    public String getDeparment() {
        return deparment;
    }

    public void setDeparment(String deparment) {
        this.deparment = deparment;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Date getVacate_starttime() {
        return vacate_starttime;
    }

    public void setVacate_starttime(Date vacate_starttime) {
        this.vacate_starttime = vacate_starttime;
    }

    public Date getVacate_endtime() {
        return vacate_endtime;
    }

    public void setVacate_endtime(Date vacate_endtime) {
        this.vacate_endtime = vacate_endtime;
    }

    public String getVacate_result() {
        return vacate_result;
    }

    public void setVacate_result(String vacate_result) {
        this.vacate_result = vacate_result;
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }
}
