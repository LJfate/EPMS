package com.lj.util;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat
public class JsonResult {
    private  Integer result;


    public  JsonResult(){}

    public JsonResult(Integer i){
        this.result=i;
    }
    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }
}
