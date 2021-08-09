package com.lj.service.impl;

import com.github.pagehelper.PageHelper;
import com.lj.dao.EmployeeDao;
import com.lj.domain.Employee;
import com.lj.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDao employeeDao;
    @Override
    public List<Employee> findAll(int page, int size ) {
        PageHelper.startPage(page,size);
        List<Employee> employees = employeeDao.findAll( );

        return employees;
    }

    @Override
    public List<Employee> findAll(int page, int size, String nameSearch) {

        PageHelper.startPage(page,size);
        List<Employee> employees = employeeDao.findAll(nameSearch );
        return employees;
    }

    @Override
    public Employee findOne(Integer pid) { return employeeDao.findOne(pid); }

    @Override
    public void deleteById(Integer dep_id) {
        employeeDao.deleteById(dep_id);
    }

    @Override
    public void update(Employee employee) {
        employeeDao.update(employee);
    }

    @Override
    public void updatezhanghu(Employee employee) {
        employeeDao.updatezhanghu(employee);
    }

    @Override
    public void add(Employee employee) {
        employeeDao.add(employee);
    }

    @Override
    public void delSelectedEmployee(String[] eids) {
        //遍历数组
        for (String id:eids)
        { //调用dao删除数据
            employeeDao.deleteById(Integer.parseInt(id));
        }

    }

    @Override
    public Employee login(String login_name, String password) {
        Employee employee = employeeDao.login(login_name, password);
        return employee;
    }
}
