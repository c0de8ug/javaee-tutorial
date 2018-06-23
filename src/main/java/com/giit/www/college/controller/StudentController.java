package com.giit.www.college.controller;

import com.giit.www.college.service.StudentBiz;
import com.giit.www.entity.Student;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;

/**
 * Created by c0de8ug on 16-2-12.
 */
@Controller
@RequestMapping("student.do")
public class StudentController {

    @Resource(name = "studentBizImpl")
    StudentBiz studentBiz;

    @RequiresRoles("admin")
    @RequestMapping("student.view")
    public String studentView(Model m) {
        //TODO 将biz命名为和业务有关的函数方法,不知道是否正确留个吭
        m.addAttribute("studentList", studentBiz.studentView());
        return "/admin/college/student";
    }

    @RequiresRoles("admin")
    @RequestMapping("student_add.view")
    public String studentAddView(Model m) {

        return "/admin/college/student_add";
    }

    @RequiresRoles("admin")
    @RequestMapping("student_update.view")
    public String studentUpdateView(Model m) {

        return "/admin/college/student_update";
    }

    @RequiresRoles("admin")
    @RequestMapping("add")
    public String add(Model m, MultipartFile pic, Student student) throws IOException {
        studentBiz.add(student, pic);
        return "redirect:/student.do/student.view";
    }

    @RequiresRoles("admin")
    @RequestMapping("delete")
    public String delete(Model m, int studentId) {
        studentBiz.delete(studentId);
        return "redirect:/student.do/student.view";
    }

}
