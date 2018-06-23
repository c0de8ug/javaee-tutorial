package com.giit.www.entity.custom;

import java.util.List;

/**
 * Created by c0de8ug on 16-2-11.
 */
public class DeptAndSpec {
    String deptName;
    List<String> specName;

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public List<String> getSpecName() {
        return specName;
    }

    public void setSpecName(List<String> specName) {
        this.specName = specName;
    }
}
