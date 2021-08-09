package com.lj.service;


import com.lj.domain.Salary;
import java.util.List;

public interface SalaryService {
public List<Salary> findAll(int page, int size, String nameSearch);

    Salary findOne(Integer id);

    void deleteById(Integer id);

    void update(Salary salary);

    void add(Salary salary);

    void delSelectedSalary(String[] sids);

    List<Salary> findByEmpId(int emp_id);
}
