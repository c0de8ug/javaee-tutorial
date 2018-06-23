package com.giit.www.college.controller;

import com.giit.www.college.service.DeptBiz;
import com.giit.www.entity.Dept;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by c0de8ug on 16-2-10.
 */

@Controller
@RequestMapping("dept.do")
public class DeptController {

    @Resource(name = "deptBizImpl")
    private DeptBiz deptBiz;

    @RequiresRoles("admin")
    @RequestMapping("dept.view")
    public String deptView(Model m) {
        m.addAttribute("deptList", deptBiz.findAll());
        return "/admin/college/dept";
    }

    @RequiresRoles("admin")
    @RequestMapping("dept_add.view")
    public String deptAddView(Model m) {
        return "/admin/college/dept_add";
    }

    @RequiresRoles("admin")
    @RequestMapping("dept_update.view")
    public String deptUpdateView(Model m) {
        return "/admin/college/dept_update";
    }

    @RequiresRoles("admin")
    @RequestMapping("add")
    public String add(String deptName) {
        deptBiz.add(deptName);
        return "redirect:/dept.do/dept.view";
    }

    @RequiresRoles("admin")
    @RequestMapping("update")
    public String update(Dept dept) {
        deptBiz.update(dept);
        return "redirect:/dept.do/dept.view";
    }

    @RequiresRoles("admin")
    @RequestMapping("delete")
    public String delete(int deptId) {
        deptBiz.delete(deptId);
        return "redirect:/dept.do/dept.view";
    }


}
