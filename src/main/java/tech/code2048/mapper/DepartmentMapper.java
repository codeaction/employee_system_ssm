package tech.code2048.mapper;

import tech.code2048.bean.Department;

import java.util.List;


public interface DepartmentMapper {
    List<Department> findAll();
    Department findByDname(String dname);
    Department findByDid(Integer did);
    int add(Department department);
    int del(Integer did);
    int update(Department department);

}
