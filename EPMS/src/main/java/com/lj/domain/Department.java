package com.lj.domain;

/**
 * 部门表
 */
public class Department {
    private  Integer dep_id;//部门id
    private String dep_name;//部门名称
    private String dep_intro; //简介

    public Integer getDep_id() {
        return dep_id;
    }

    public void setDep_id(Integer dep_id) {
        this.dep_id = dep_id;
    }

    public String getDep_name() {
        return dep_name;
    }

    public void setDep_name(String dep_name) {
        this.dep_name = dep_name;
    }

    public String getDep_intro() {
        return dep_intro;
    }

    public void setDep_intro(String dep_intro) {
        this.dep_intro = dep_intro;
    }
}
