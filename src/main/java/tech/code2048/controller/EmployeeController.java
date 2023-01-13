package tech.code2048.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tech.code2048.bean.Employee;
import tech.code2048.bean.EmployeeVo;
import tech.code2048.bean.RespBean;
import tech.code2048.service.EmployeeService;

import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/admin/employee")
public class EmployeeController  {
    @Autowired
    private EmployeeService employeeService;

    //分页查询
    @GetMapping("/page")
    public RespBean findByPage(Integer currentPage, String ename) {
        if(currentPage == null) {
            currentPage = 1;
        }

        PageHelper.startPage(currentPage, 5);

        List<EmployeeVo> employeeVoList = employeeService.findAll(ename);

        PageInfo<EmployeeVo> pageInfo = new PageInfo<>(employeeVoList, 5);

        return RespBean.ok("查询成功", pageInfo);
    }

    //添加
    @PostMapping("/")
    public RespBean add(@RequestBody Employee employee) throws SQLException {
        //添加
        employeeService.add(employee);
        //响应信息给浏览器
        return RespBean.ok("添加成功");
    }

    @DeleteMapping("/{eid}")
    public RespBean del(@PathVariable("eid") Integer eid) {
        //设置员工状态为离职
        employeeService.chgEstate(eid,0);

        //响应数据
        return RespBean.ok("删除成功");
    }

    @GetMapping("/id/{eid}")
    public RespBean findById(@PathVariable("eid") Integer eid) throws ServletException, IOException {
        //根据主键查询员工
        Employee employee = employeeService.findById(eid);

        //响应数据
        return RespBean.ok("查询成功", employee);
    }

    @PutMapping("/")
    public RespBean update(@RequestBody Employee employee) {
        //修改
        employeeService.update(employee);
        //响应信息给浏览器
        return RespBean.ok("添加成功");
    }
}
