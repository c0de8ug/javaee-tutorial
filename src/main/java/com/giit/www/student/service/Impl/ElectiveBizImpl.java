package com.giit.www.student.service.Impl;

import com.giit.www.college.dao.SectionDao;
import com.giit.www.college.dao.TakesDao;
import com.giit.www.entity.Section;
import com.giit.www.entity.custom.SectionCustom;
import com.giit.www.student.service.ElectiveBiz;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by c0de8ug on 16-2-16.
 */
@Service
public class ElectiveBizImpl implements ElectiveBiz {

    @Resource
    private TakesDao takesDao;

    @Resource
    private SectionDao sectionDao;

    public void add(int secId, String stdId) {
        takesDao.add(secId, stdId);
    }

    @Override
    public List<SectionCustom> findAllSection() {
        return sectionDao.findAllCustom();
    }

    @Override
    public void delete(int secId, String stdId) {
        takesDao.delete(secId,stdId);
    }
}
