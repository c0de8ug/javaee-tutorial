package com.giit.www.college.controller;

import com.giit.www.college.service.CourseBiz;
import com.giit.www.entity.Course;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by c0de8ug on 16-2-12.
 */
@Controller
@RequestMapping("course.do")
public class CourseController {
    @Resource(name = "courseBizImpl")
    private CourseBiz courseBiz;

    @RequiresRoles("admin")
    @RequestMapping("course.view")
    private String courseView(Model m) {
        m.addAttribute("courseList", courseBiz.findAll());
        return "/admin/college/course";
    }

    @RequiresRoles("admin")
    @RequestMapping("course_add.view")
    private String courseAddView(Model m) {
        m.addAttribute("specNameList", courseBiz.findAllSpecName());
        return "/admin/college/course_add";
    }

    @RequiresRoles("admin")
    @RequestMapping("add")
    private String add(Course course) {
        courseBiz.add(course);
        return "redirect:/course.do/course.view";
    }

    @RequiresRoles("admin")
    @RequestMapping("delete")
    private String delete(String courseTitle) {
        courseBiz.delete(courseTitle);
        return "redirect:/course.do/course.view";
    }
}

