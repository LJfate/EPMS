package com.lj.dao;

import com.lj.domain.Attendance;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AttendanceDao {

    List<Attendance> findAll(@Param(value = "nameSearch") String nameSearch);

    Attendance findOne(Integer aid);

    void deleteById(Integer att_id);

    void update(Attendance attendance);

    void add(Attendance attendance);

    List<Attendance> findByEmpId(int emp_id);
}
