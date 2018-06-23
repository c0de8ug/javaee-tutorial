package com.giit.www.entity.custom;

import java.util.List;

/**
 * Created by c0de8ug on 16-2-15.
 */
public class ChangedItems {
    int secId;

    public int getSecID() {
        return secId;
    }

    public void setSecID(int secId) {
        this.secId = secId;
    }

    public List<AlterItem> getAlterItemList() {
        return alterItemList;
    }

    public void setAlterItemList(List<AlterItem> alterItemList) {
        this.alterItemList = alterItemList;
    }

    public List<DeleteItem> getDeleteItemList() {
        return deleteItemList;
    }

    public void setDeleteItemList(List<DeleteItem> deleteItemList) {
        this.deleteItemList = deleteItemList;
    }

    List<AlterItem> alterItemList;


    List<DeleteItem> deleteItemList;

    public static class AlterItem {
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

        public String getNewBookTitle() {
            return newBookTitle;
        }

        public void setNewBookTitle(String newBookTitle) {
            this.newBookTitle = newBookTitle;
        }

        public String getNewIsbn() {
            return newIsbn;
        }

        public void setNewIsbn(String newIsbn) {
            this.newIsbn = newIsbn;
        }

        public String getNewDateOfPrinting() {
            return newDateOfPrinting;
        }

        public void setNewDateOfPrinting(String newDateOfPrinting) {
            this.newDateOfPrinting = newDateOfPrinting;
        }

        public String getNewAuthor() {
            return newAuthor;
        }

        public void setNewAuthor(String newAuthor) {
            this.newAuthor = newAuthor;
        }

        public String getNewPress() {
            return newPress;
        }

        public void setNewPress(String newPress) {
            this.newPress = newPress;
        }

        public String getNewCategory() {
            return newCategory;
        }

        public void setNewCategory(String newCategory) {
            this.newCategory = newCategory;
        }

        public String getNewUnitPrice() {
            return newUnitPrice;
        }

        public void setNewUnitPrice(String newUnitPrice) {
            this.newUnitPrice = newUnitPrice;
        }

        public String getNewRemark() {
            return newRemark;
        }

        public void setNewRemark(String newRemark) {
            this.newRemark = newRemark;
        }

        String bookTitle;
        String isbn;
        String newBookTitle;
        String newIsbn;
        String newDateOfPrinting;
        String newAuthor;
        String newPress;
        String newCategory;
        String newUnitPrice;
        String newRemark;
    }

    public static class DeleteItem {
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

        String bookTitle;
        String isbn;
    }


}
