package com.lj.service;

import com.lj.domain.Department;

import java.util.List;

public interface DepartmentService {
public List<Department> findAll(int page,int size,String nameSearch);

    Department findOne(Integer pid);

    void deleteById(Integer per_id);

    void update(Department department);

    void add(Department department);
    //删除选中复选框
    void delSelectedDepartment(String[] dids);
}
