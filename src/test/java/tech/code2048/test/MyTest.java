package tech.code2048.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tech.code2048.bean.Admin;
import tech.code2048.bean.Employee;
import tech.code2048.config.MainConfig;
import tech.code2048.mapper.AdminMapper;
import tech.code2048.mapper.DepartmentMapper;
import tech.code2048.mapper.EmployeeMapper;
import tech.code2048.service.EmployeeService;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = "classpath:beans.xml")
@ContextConfiguration(classes = MainConfig.class)
public class MyTest {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private EmployeeService employeeService;

    @Test
    public void test5() {
        employeeMapper.findAll("华强").stream().forEach(System.out::println);
    }

    @Test
    public void test6() throws SQLException {
        System.out.println(employeeMapper.maxEno());
    }

    @Test
    public void test1() {
        Admin admin = adminMapper.findByUsernameAndPassword("admin", "123456");
        System.out.println(admin);
    }

    @Test
    public void test2() {
        departmentMapper.findAll().stream().forEach(System.out::println);
    }

    @Test
    public void test3() {
        System.out.println(departmentMapper.findByDid(1));
    }

    @Test
    public void test4() throws SQLException {
        Employee e = new Employee(null,null,"1", 1, "男", "财务", new Date(), new BigDecimal(1000), 1, 1);
        employeeService.add(e);
    }
}
