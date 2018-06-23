package com.giit.www.system.controller;

import com.giit.www.system.service.AccountBiz;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by c0de8ug on 16-2-16.
 */
@Controller

@RequestMapping("account.do")
public class AccountController {
    @Resource(name = "accountBizImpl")
    private AccountBiz accountBiz;

    @RequiresAuthentication
    @RequestMapping("profile.view")
    public String profileView() {
        return "/admin/system/account/profile";

    }

    @RequiresAuthentication
    @RequestMapping("update")
    public String update(HttpSession session, String password) {
        String id = (String) session.getAttribute("username");
        accountBiz.updatePassword(id, password);
        return "redirect:/account.do/profile.view";
    }
}
