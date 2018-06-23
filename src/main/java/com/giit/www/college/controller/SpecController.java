package com.giit.www.college.controller;

import com.giit.www.college.service.DeptBiz;
import com.giit.www.college.service.SpecBiz;
import com.giit.www.entity.Spec;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by c0de8ug on 16-2-11.
 */
@Controller
@RequestMapping("spec.do")
public class SpecController {

    @Resource(name = "specBizImpl")
    SpecBiz specBiz;

    @RequiresRoles("admin")
    @RequestMapping("spec_add.view")
    public String specAddView(Model m) {
        m.addAttribute("deptNameList", specBiz.findDpet());
        return "/admin/college/spec_add";
    }

    //TODO 该名字deptAndSpec不好,但是不知道如何命名-, -
    @RequiresRoles("admin")
    @RequestMapping("spec.view")
    public String specView(Model m) {
        m.addAttribute("deptAndSpec", specBiz.findDeptAndSpec());
        return "/admin/college/spec";
    }
    @RequiresRoles("admin")
    @RequestMapping("spec_update.view")
    public String specUpdateView(Model m) {
        return "/admin/college/spec_update";
    }
    @RequiresRoles("admin")
    @RequestMapping("update")
    public String update(@Param("specName") String newSpecName, @Param("newSpecName") String specName) {
        specBiz.update(specName, newSpecName);
        return "redirect:/spec.do/spec.view";
    }
    @RequiresRoles("admin")
    @RequestMapping("add")
    public String add(Spec spec) {
        specBiz.add(spec);
        return "redirect:/spec.do/spec.view";
    }
    @RequiresRoles("admin")
    @RequestMapping("delete")
    public String delete(String specName) {
        specBiz.delete(specName);
        return "redirect:/spec.do/spec.view";
    }

}

