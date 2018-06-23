package com.giit.www.system.controller;

import com.giit.www.entity.User;
import com.giit.www.system.dao.UserDao;
import com.giit.www.system.service.AccountBiz;
import com.giit.www.system.service.UserBiz;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by c0de8ug on 16-2-14.
 */
@Controller
public class LoginController {

    @Resource(name = "userBizImpl")
    UserBiz userBiz;

    @RequestMapping("login")
    public String login(HttpServletRequest req, Model model, HttpSession session) {
        String exceptionClassName = (String) req.getAttribute("shiroLoginFailure");
        String error = null;
        if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
            error = "用户名/密码错误";
        } else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
            error = "用户名/密码错误";
        } else if (exceptionClassName != null) {
            error = "其他错误：" + exceptionClassName;
        }

        //TODO 这里以后可以把角色更换成资源控制后动态生成页面,（-->这里有疑问-->是不是可以使用自定义角色？shiro张开涛的16章有个自定义标签扫描出的角色）
        org.apache.shiro.subject.Subject subject = SecurityUtils.getSubject();
        boolean isAuthenticated = subject.isAuthenticated();

        if (isAuthenticated) {
            String principal = (String) subject.getPrincipal();
            session.setAttribute("username", principal);

            switch (principal) {
                case "admin":
                    return "/admin/main";
                case "teacher":
                    return "/teacher/main";
                case "student":
                    return "/student/main";
                case "supplier":
                    return "redirect:supplier.do/supplier.view";
            }
        }

        return "redirect:login.jsp";
    }


}
