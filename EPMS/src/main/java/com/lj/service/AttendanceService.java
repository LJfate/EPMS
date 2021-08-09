package com.lj.service;

import com.lj.domain.Attendance;

import java.util.List;

public interface AttendanceService {
public List<Attendance> findAll(int page ,int size,String nameSearch);

    Attendance findOne(Integer pid);

    void deleteById(Integer per_id);

    void update(Attendance attendance);

    void add(Attendance attendance);

    void delSelectAttendance(String[] aid);

    List<Attendance> findByEmpId(int emp_id);
}
