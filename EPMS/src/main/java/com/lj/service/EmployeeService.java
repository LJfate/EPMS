package com.lj.service;

import com.lj.domain.Employee;

import java.util.List;

public interface EmployeeService {
     List<Employee> findAll(int page, int size );
     List<Employee> findAll(int page, int size,String nameSearch );
    Employee findOne(Integer eid);

    void deleteById(Integer emp_id);

    void update(Employee employee);
    void updatezhanghu(Employee employee);
    void add(Employee employee);
    //删除选中的员工信息
    void delSelectedEmployee(String[] eids);

    Employee login(String login_name, String password);
}
