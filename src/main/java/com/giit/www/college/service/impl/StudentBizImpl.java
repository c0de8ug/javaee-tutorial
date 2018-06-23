package com.giit.www.college.service.impl;

import com.giit.www.college.dao.StudentDao;
import com.giit.www.college.service.StudentBiz;
import com.giit.www.entity.Student;
import com.giit.www.entity.User;
import com.giit.www.system.dao.RoleDao;
import com.giit.www.system.service.UserBiz;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.beans.Transient;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by c0de8ug on 16-2-13.
 */
@Service
public class StudentBizImpl implements StudentBiz {
    @Resource
    private StudentDao studentDao;

    @Resource
    private RoleDao roleDao;

    @Resource(name = "userBizImpl")
    private UserBiz userBiz;

    public List<Student> studentView() {
        return studentDao.findAll();
    }

    @Transactional
    public void add(Student student, MultipartFile pic) throws IOException {

        if (pic.getSize() != 0) {
            String originalFilename = pic.getOriginalFilename();

            String fileType = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFilename = UUID.randomUUID() + fileType;

            //TODO 这里的路径分配应该放到环境变量
            String path = "/home/c0de8ug/software/apache-tomcat-8.0.28/pic/";

            File dest = new File(path + newFilename);
            pic.transferTo(dest);

            student.setPicPath(newFilename);
        }

        studentDao.add(student);

        //TODO 这里学生的学号是临时用的，写的很垃圾，以后改成username 和自动生成的id主键进行关联,学号使用班级号+人数生成
        User user = new User();
        user.setUserId(student.getStudentId());
        Long roleId = roleDao.findByDescription("学生").getId();
        List tempList = new ArrayList<>();
        tempList.add(roleId);
        user.setRoleIds(tempList);
        user.setLocked(false);
        user.setPassword(student.getPassword());
        userBiz.add(user);
    }

    @Override
    public void update(Student student) {
        studentDao.update(student);
    }

    //TODO 应该连带删除掉student和staff
    @Transactional
    @Override
    public void delete(int studentId) {
        studentDao.delete(studentId);
    }

}
