package com.giit.www.college.service.impl;

import com.giit.www.college.dao.ClazzDao;
import com.giit.www.college.dao.DeptDao;
import com.giit.www.college.dao.SpecDao;
import com.giit.www.college.service.ClazzBiz;
import com.giit.www.entity.Clazz;
import com.giit.www.entity.custom.DeptAndSpec;
import com.google.gson.Gson;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * Created by c0de8ug on 16-2-11.
 */
@Service
public class ClazzBizImpl implements ClazzBiz {

    @Resource
    private ClazzDao clazzDao;
    @Resource
    private DeptDao deptDao;
    @Resource
    private SpecDao specDao;

    public void add(String deptName, String specName, String year) {
        Clazz clazz = new Clazz();
        clazz.setSpecName(specName);
        int classCount = clazzDao.getClassCount(specName, year) + 1;
        clazz.setClazzId(year.substring(2) + deptDao.findIdByName(deptName) + specDao.findIdByName(specName) + classCount);
        clazz.setYear(year);
        clazzDao.add(clazz);
    }

    public void delete(int clazzId) {
        clazzDao.delete(clazzId);
    }

    public List<Class> findAll() {
        return clazzDao.findAll();
    }

    @Override
    public List<DeptAndSpec> findDeptAndSpec() {
        return specDao.findDeptAndSpec();
    }


    @Override
    public String findDeptAndSpecJson() {
        Gson gson = new Gson();

        List<DeptAndSpec> deptAndSpecList = specDao.findDeptAndSpec();

        HashMap<String, List<String>> map = new HashMap();


        for (DeptAndSpec deptAndSpec : deptAndSpecList) {
            map.put(deptAndSpec.getDeptName(), deptAndSpec.getSpecName());
        }
        String json = gson.toJson(map);
        return json;
    }

    //TODO 在这里感觉不应该查询两次应该使用上面的结果keyset,磁盘的开销远大于运算,如果开一个deptAndSpecList变量存储这个变量是线程安全的么,留坑= =！
    //感觉这里应该是取决于biz的BEAN在spring中的作用域
    @Override
    public List<String> findDeptNameList() {
        return deptDao.findAllDeptName();
    }


}
