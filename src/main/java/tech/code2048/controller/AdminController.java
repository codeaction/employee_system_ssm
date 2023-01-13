package tech.code2048.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import tech.code2048.bean.Admin;
import tech.code2048.bean.RespBean;
import tech.code2048.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private DefaultKaptcha defaultKaptcha;

    //生成验证码
    @RequestMapping("/validateCode")
    public void defaultKaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        byte[] captchaChallengeAsJpeg = null;
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        try {
            // 生产验证码字符串并保存到session中
            String createText = defaultKaptcha.createText();
            request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, createText);
            // 使用生成的验证码字符串返回一个BufferedImage对象并转为byte写入到byte数组中
            BufferedImage challenge = defaultKaptcha.createImage(createText);
            ImageIO.write(challenge, "jpg", jpegOutputStream);
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // 定义response输出类型为image/jpeg类型，使用response输出流输出图片的byte数组
        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream = response.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();
    }

    //登录
    @ResponseBody
    @RequestMapping("/login")
    public RespBean login(String username, String password, String validateCode, HttpSession session) {
        //获取存放在session中的验证码
        String validateCodeSession = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        //判断验证码是否正确
        if(validateCodeSession.equalsIgnoreCase(validateCode)) {
            //验证用户名和密码是否正确
            Admin admin = adminService.login(username, password);
            if(admin != null) {
                //将用户信息存放在session中
                session.setAttribute("admin", admin);
                //登录成功
                return RespBean.ok("登录成功");
            } else {
                //登录失败
                return RespBean.error("用户名或密码错误, 登录失败");
            }
        } else {
            //验证码输入错误
            return RespBean.error("验证码错误");
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        //session失效
        session.invalidate();
        //重定向到登录页
        return "redirect:/toLogin";
    }
}
