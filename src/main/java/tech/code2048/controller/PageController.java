package tech.code2048.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/admin/toIndex")
    public String toIndex() {
        return "index";
    }

    @RequestMapping("/admin/toDepartment")
    public String department() {
        return "department";
    }

    @RequestMapping("/admin/toEmployee")
    public String employee() {
        return "employee";
    }
}
