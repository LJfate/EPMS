package com.lj.domain;

import java.io.Serializable;
//审核状态，1已审核，0未审核
public class Status implements Serializable {
    private  static  final  long serialVersionUID=1L;
    private Integer id;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
