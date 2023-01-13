package tech.code2048.service;

import tech.code2048.bean.Employee;
import tech.code2048.bean.EmployeeVo;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeService {
    List<EmployeeVo> findAll(String ename);
    Employee findById(Integer eid);
    void add(Employee e) throws SQLException;
    int chgEstate(Integer eid, Integer estate);
    int update(Employee e);
}
