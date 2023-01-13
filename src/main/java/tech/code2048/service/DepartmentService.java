package tech.code2048.service;


import tech.code2048.bean.Department;

import java.util.List;

public interface DepartmentService {
    //查询所有
    List<Department> findAll();
    //根据Id查询
    Department findByDid(Integer did);
    //添加
    int add(Department department);
    //删除
    int del(Integer did);
    //修改
    int update(Department department);
}
