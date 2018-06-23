package com.giit.www.entity.custom;

import com.giit.www.entity.Book;

/**
 * Created by c0de8ug on 16-2-15.
 */
public class BookInfo extends Book {
    String remark;

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
