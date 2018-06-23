package com.giit.www.college.service;

import com.giit.www.entity.custom.DeptAndSpec;

import java.util.List;

/**
 * Created by c0de8ug on 16-2-11.
 */
public interface ClazzBiz {
    public void add(String deptName, String specName, String year);

    public void delete(int clazzId);

    public List<Class> findAll();

    public List<DeptAndSpec> findDeptAndSpec();

    public String findDeptAndSpecJson();

    public List<String> findDeptNameList();
}
