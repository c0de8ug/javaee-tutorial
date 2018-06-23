package com.giit.www.entity.custom;

/**
 * Created by c0de8ug on 16-2-16.
 */
public class OrderBookReviewVo {
    String speciality;
    String courseTitle;
    String bookTitle;
    String isbn;
    String dateOfPrinting;
    String author;
    String category;
    float unitPrice;
    String remark;
    String press;
    int stdCount;
    int secId;

    public int getSecId() {
        return secId;
    }

    public void setSecId(int secId) {
        this.secId = secId;
    }

    public int getStdCount() {
        return stdCount;
    }

    public void setStdCount(int stdCount) {
        this.stdCount = stdCount;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getDateOfPrinting() {
        return dateOfPrinting;
    }

    public void setDateOfPrinting(String dateOfPrinting) {
        this.dateOfPrinting = dateOfPrinting;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
