package com.lj.dao;

import com.lj.domain.Department;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentDao {
                //使用mybatis的动态sql，要加@param， 否则映射不上
     List<Department> findAll(@Param(value="nameSearch1") String nameSearch);
     Department findOne(Integer did);
    void deleteById(Integer dep_id);
    void update(Department department);
    void add(Department department);
}
