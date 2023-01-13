package tech.code2048.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.code2048.bean.Employee;
import tech.code2048.bean.EmployeeVo;
import tech.code2048.mapper.EmployeeMapper;
import tech.code2048.service.EmployeeService;

import java.sql.SQLException;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<EmployeeVo> findAll(String ename) {
        return employeeMapper.findAll(ename);
    }

    @Override
    public Employee findById(Integer eid) {
        return employeeMapper.findById(eid);
    }

    @Transactional
    @Override
    public void add(Employee e) throws SQLException {
            //生成工号
            String maxEnoStr = employeeMapper.maxEno();
            int maxEno = Integer.parseInt(maxEnoStr);
            maxEno++;
            e.setEno(maxEno + "");
            e.setEstate(1);
            //添加
            employeeMapper.add(e);
    }

    @Override
    public int chgEstate(Integer eid, Integer estate) {
        return employeeMapper.chgEstate(eid, estate);
    }

    @Override
    public int update(Employee e) {
        return employeeMapper.update(e);
    }
}
