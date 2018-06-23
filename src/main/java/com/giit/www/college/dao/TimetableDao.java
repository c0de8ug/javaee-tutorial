package com.giit.www.college.dao;

import com.giit.www.entity.Timetable;

/**
 * Created by c0de8ug on 16-2-13.
 */
public interface TimetableDao {
    public void add(Timetable timetable);

    public void delete(int secId);
}
