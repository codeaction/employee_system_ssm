package tech.code2048.interceptor;

import tech.code2048.bean.Admin;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 定义拦截器, 进行登录校验
 */
public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取Session
        HttpSession session = request.getSession();
        //获取已登录用户信息
        Admin admin = (Admin) session.getAttribute("admin");

        if(admin != null) {
            return true;
        }

        response.sendRedirect(request.getContextPath() + "/toLogin");
        return false;
    }
}
