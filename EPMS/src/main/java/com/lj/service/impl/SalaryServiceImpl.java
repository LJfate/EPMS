package com.lj.service.impl;

import com.github.pagehelper.PageHelper;
import com.lj.dao.SalaryDao;
import com.lj.domain.Salary;
import com.lj.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class SalaryServiceImpl implements SalaryService, Serializable {
    private static final long serialVersionUID=1l;
    @Autowired
    private SalaryDao salaryDao;
    @Override
    public List<Salary> findAll(int page , int size, String nameSearch) {
        PageHelper.startPage(page,size);
        List<Salary> salaries = salaryDao.findAll(nameSearch);

        return salaries;
    }

    @Override
    public Salary findOne(Integer id) {

        return salaryDao.findOne(id);
    }

    @Override
    public void deleteById(Integer id) {
        salaryDao.deleteById(id);
    }

    @Override
    public void update(Salary salary) {
        salaryDao.update(salary);
    }

    @Override
    public void add(Salary salary) {
        salaryDao.add(salary);
    }

    @Override
    public void delSelectedSalary(String[] sids) {
        for (String sid:sids
             ) {
            salaryDao.deleteById(Integer.parseInt(sid));
        }
    }

    @Override
    public List<Salary> findByEmpId(int emp_id) {
        return salaryDao.findByEmpId(emp_id);
    }
}
