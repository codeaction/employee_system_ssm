package tech.code2048.mapper;

import org.apache.ibatis.annotations.Param;
import tech.code2048.bean.Employee;
import tech.code2048.bean.EmployeeVo;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeMapper {
    //根据部门ID查询员工
    List<Employee> findByDid(Integer did);
    //根据eid查询员工
    Employee findById(Integer eid);
    //查询所有
    List<EmployeeVo> findAll(@Param("ename") String ename);
    //添加
    int add(Employee employee) throws SQLException;
    //查询最大的工号
    String maxEno() throws SQLException;
    //设置在职状态
    int chgEstate(@Param("eid") Integer eid, @Param("estate") Integer estate);
    //修改
    int update(Employee e);
}
