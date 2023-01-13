package tech.code2048.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tech.code2048.bean.Department;
import tech.code2048.bean.Employee;
import tech.code2048.mapper.DepartmentMapper;
import tech.code2048.mapper.EmployeeMapper;
import tech.code2048.service.DepartmentService;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Department> findAll() {
        return departmentMapper.findAll();
    }

    @Override
    public Department findByDid(Integer did) {
        return departmentMapper.findByDid(did);
    }

    @Override
    public int add(Department department) {
        /**
         * 保证，添加的部门名称不能和其它部门的名称重复
         * 1.根据部门名称查询
         *      |-- 查得到， 不允许添加
         *      |-- 查不到， 2
         * 2.添加
         */
        Department d = departmentMapper.findByDname(department.getDname());
        if(d != null) { //将要添加的名字在系统中已经存在，不允许添加
            return -1;
        }
        return departmentMapper.add(department);
    }

    @Override
    public int del(Integer did) {
        /**
         * 被删除的部门下不能存在员工
         * 1.根据did查询员工
         *      |--- 有员工， 不允许删除
         *      |--- 没有员工， 2
         * 2. 删除
         */
        List<Employee> emps = employeeMapper.findByDid(did);
        if(emps.size() > 0) {
            return -1;
        }
        return departmentMapper.del(did);
    }

    @Override
    public int update(Department department) {
        /**
         * 避免：修改之后的名字不能和其它项的名称重复
         * 1. 根据修改之后的名字查询
         *      |--查得到，判断查到的did和要修改的这一项的did是否相同
         *          |--不同，不允许修改
         *      |--查不到，2
         * 2. 修改
         */
        //根据修改之后的名字查询
        Department d = departmentMapper.findByDname(department.getDname());
        if(d != null && d.getDid() != department.getDid()) {
            return -1;
        }
        return departmentMapper.update(department);
    }
}
