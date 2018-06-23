package com.giit.www.entity;

/**
 * Created by c0de8ug on 16-2-9.
 */
public class Book {

    String bookTitle;
    String isbn;
    String dateOfPrinting;
    String author;
    String press;
    String category;
    Short unitPrice;

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

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Short getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Short unitPrice) {
        this.unitPrice = unitPrice;
    }
}
