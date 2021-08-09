package com.lj.dao;

import com.lj.domain.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeDao {
    //查询所有员工信息
   // @Select("select * from personnel")
      List<Employee> findAll( );
      List<Employee> findAll( @Param(value="nameSearch") String nameSearch);

    //查询单个员工信息
    //@Select("select * from personnel where per_id=#{per_id}")
    Employee findOne(Integer eid);
    Employee login(@Param("login_name") String login_name,@Param("password") String password);
    void deleteById(Integer emp_id);

    void update(Employee employee);
    void updatezhanghu(Employee employee);
    void add(Employee employee);

    void delSelectedEmployee(String[] pids);
}
