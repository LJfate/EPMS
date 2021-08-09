package com.lj.domain;
//工资表
public class Salary {
    //编号
    private  Integer id;
    //员工id
    private  Integer emp_id;
    //年
    private  String sal_year;
    //月
    private  String sal_month;
    //基本工资
    private  Integer basic_wages;
    //一对一
    private  Employee employee;
    //补贴
    private Integer subsidies;
    //到手工资
    private Integer  real_wages;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Integer getBasic_wages() {
        return basic_wages;
    }

    public void setBasic_wages(Integer basic_wages) {
        this.basic_wages = basic_wages;
    }

    public Integer getSubsidies() {
        return subsidies;
    }

    public void setSubsidies(Integer subsidies) {
        this.subsidies = subsidies;
    }

    public Integer getReal_wages() {
        return real_wages;
    }

    public void setReal_wages(Integer real_wages) {
        this.real_wages = real_wages;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getSal_year() {
        return sal_year;
    }

    public void setSal_year(String sal_year) {
        this.sal_year = sal_year;
    }

    public String getSal_month() {
        return sal_month;
    }

    public void setSal_month(String sal_month) {
        this.sal_month = sal_month;
    }
}
