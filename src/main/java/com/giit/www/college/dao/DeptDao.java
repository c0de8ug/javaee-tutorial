package com.giit.www.college.dao;

import com.giit.www.entity.custom.DeptAndSpec;
import com.giit.www.entity.Dept;

import java.util.List;

/**
 * Created by c0de8ug on 16-2-10.
 */
public interface DeptDao {
    public List<Dept> findAll();

    public void add(String deptName);

    public String findIdByName(String deptName);

    public void update(Dept dept);

    public void delete(int deptId);

    public List<String> findAllDeptName();

}
