package com.giit.www.college.dao;

import com.giit.www.entity.Section;
import com.giit.www.entity.custom.SectionCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by c0de8ug on 16-2-12.
 */
public interface SectionDao {

    //TODO 狗血命名！！
    public List<SectionCustom> findAllCustom();

    public void delete(int sectionId);

    public void add(Section section);

    public List<Section> findSelectedSection(@Param("staffId") String staffId, @Param("year") String year);

    int getSecId(String item, String s);

    public List<Section> findAll();
}
