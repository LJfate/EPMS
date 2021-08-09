package com.lj.dao;


import com.lj.domain.Salary;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SalaryDao {
        //参数绑定
    List<Salary> findAll(@Param(value = "nameSearch") String nameSearch);

    Salary findOne(Integer id);

    void deleteById(Integer id);

    void update(Salary salary);

    void add(Salary salary);

    List<Salary> findByEmpId(int emp_id);
}
