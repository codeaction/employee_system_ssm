package tech.code2048.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tech.code2048.bean.Department;
import tech.code2048.bean.RespBean;
import tech.code2048.service.DepartmentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/admin/department")
public class DepartmentController extends HttpServlet { //servlet
    @Autowired
    private DepartmentService departmentService;

    //查询所有部门
    @GetMapping("/list")
    public RespBean findAll() {
        List<Department> departmentList = departmentService.findAll();
        return RespBean.ok("查询成功", departmentList);
    }

    //添加
    @PostMapping("/")
    public RespBean add(@RequestBody Department department) {
        //添加
        int result = departmentService.add(department);
        if(result == -1) {
            return RespBean.error("该部门名称已经存在，不允许添加");
        } else {
            return RespBean.ok();
        }
    }

    //删除
    @DeleteMapping("/{did}")
    public RespBean del(@PathVariable("did") Integer did) {
        //删除
        int result = departmentService.del(did);
        if(result == -1) {
            return RespBean.error("该部门中还有员工，无法删除");
        } else {
            return RespBean.ok();
        }
    }

    //修改
    @PutMapping("/")
    public RespBean update(@RequestBody Department department) {
        //修改
        int result = departmentService.update(department);
        if(result == -1) {
            return RespBean.error("修改之后的部门名称和其它部门的名称重复，不允许修改");
        } else {
            return RespBean.ok("修改部门成功");
        }
    }

    //根据ID查询
    @GetMapping("/did/{did}")
    public RespBean findByDid(@PathVariable("did") Integer did) throws ServletException, IOException {
        Department department = departmentService.findByDid(did);
        return RespBean.ok("查询成功", department);
    }
}
