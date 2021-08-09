package com.lj.service.impl;

import com.github.pagehelper.PageHelper;
import com.lj.dao.DepartmentDao;
import com.lj.domain.Department;
import com.lj.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;
    @Override
    public List<Department> findAll(int page,int size,String nameSearch) {
        PageHelper.startPage(page,size);
        List<Department> departments = departmentDao.findAll(nameSearch);

        return departments;
    }

    @Override
    public Department findOne(Integer pid) {

        return departmentDao.findOne(pid);
    }

    @Override
    public void deleteById(Integer per_id) {
        departmentDao.deleteById(per_id);
    }

    @Override
    public void update(Department department) {
        departmentDao.update(department);
    }

    @Override
    public void add(Department department) {
        departmentDao.add(department);
    }

    @Override
    public void delSelectedDepartment(String[] dids) {
        for (String  did:dids
             ) {
            departmentDao.deleteById(Integer.parseInt(did));
        }

    }
}
