package com.lj.util;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {
    private static  SimpleDateFormat simpleDateFormat;
    public static String date2String(Date date, String model){
        simpleDateFormat = new SimpleDateFormat(model);
        String date1 = simpleDateFormat.format(date);
        return date1;
    }
    public  static  Date string2Date(String date,String model)   {
        simpleDateFormat = new SimpleDateFormat(model);
        Date string1 = null;
        try {
            string1 = simpleDateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return string1;
    }
}
