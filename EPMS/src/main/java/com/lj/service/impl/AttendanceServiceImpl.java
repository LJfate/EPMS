package com.lj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lj.dao.AttendanceDao;
import com.lj.domain.Attendance;
import com.lj.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceServiceImpl implements AttendanceService {
    @Autowired
    private AttendanceDao attendanceDao;
    @Override
    public List<Attendance> findAll(int page ,int size,String nameSearch) {
        PageHelper.startPage(page,size);
        List<Attendance> attendances = attendanceDao.findAll(nameSearch);

        return attendances;
    }

    @Override
    public Attendance findOne(Integer pid) {

        return attendanceDao.findOne(pid);
    }

    @Override
    public void deleteById(Integer per_id) {
        attendanceDao.deleteById(per_id);
    }

    @Override
    public void update(Attendance attendance) {
        attendanceDao.update(attendance);
    }

    @Override
    public void add(Attendance attendance) {
        attendanceDao.add(attendance);
    }

    @Override
    public void delSelectAttendance(String[] aid) {
        for (String id:aid
             ) {
          attendanceDao.deleteById(Integer.parseInt(id));
        }
    }

    @Override
    public  List<Attendance> findByEmpId(int emp_id) {
      return   attendanceDao.findByEmpId(emp_id);
    }
}
