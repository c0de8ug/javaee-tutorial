package com.giit.www.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by c0de8ug on 16-2-16.
 */

//TODO 由于放在WEB-INF所以在对主页跳转不能直接链接访问,等程序写多后要善于总结比较后改正，这样写太坑
@Controller
@RequestMapping("main.do")
public class MainController {

    @RequestMapping("admin")
    public String adminMainView() {
        return "/admin/main";
    }

    @RequestMapping("student")
    public String studentMainView() {
        return "/student/main";
    }

    @RequestMapping("teacher")
    public String teacherMainView() {
        return "/teacher/main";
    }
}
