package com.giit.www.entity.custom;

import com.giit.www.entity.Section;

import java.util.List;

/**
 * Created by c0de8ug on 16-2-15.
 */

//TODO命名风格有问题
public class AddedBookVo {
    String secId;
    String courseTitle;

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    List<BookInfo> bookInfoList;

    public String getSecId() {
        return secId;
    }

    public void setSecId(String secId) {
        this.secId = secId;
    }

    public List<BookInfo> getBookInfoList() {
        return bookInfoList;
    }

    public void setBookInfoList(List<BookInfo> bookInfoList) {
        this.bookInfoList = bookInfoList;
    }
}
