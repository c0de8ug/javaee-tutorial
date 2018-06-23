package com.giit.www.college.dao;

import org.apache.ibatis.annotations.Param;

/**
 * Created by c0de8ug on 16-2-16.
 */

public interface TakesDao {
    public int getStdCountInSection(int secId);

    public void add(@Param("secId") int secId, @Param("stdId") String stdId);

    public void delete(@Param("secId") int secId, @Param("stdId") String stdId);
}
