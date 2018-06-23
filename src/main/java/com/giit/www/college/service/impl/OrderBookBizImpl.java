package com.giit.www.college.service.impl;

import com.giit.www.college.dao.BookDao;
import com.giit.www.college.dao.OrderBookDao;
import com.giit.www.college.dao.SectionDao;
import com.giit.www.college.dao.TakesDao;
import com.giit.www.college.service.OrderBookBiz;
import com.giit.www.entity.Book;
import com.giit.www.entity.OrderBook;
import com.giit.www.entity.Section;
import com.giit.www.entity.custom.AddedBookVo;
import com.giit.www.entity.custom.ChangedItems;
import com.giit.www.entity.custom.OrderBookReviewVo;
import com.giit.www.entity.custom.OrderBookVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by c0de8ug on 16-2-13.
 */
@Service
public class OrderBookBizImpl implements OrderBookBiz {

    @Resource
    OrderBookDao orderBookDao;

    @Resource
    SectionDao sectionDao;

    @Resource
    BookDao bookDao;

    @Resource
    TakesDao takesDao;

    public int ITEMNUM = 8;

    @Override
    public List<Section> findSelectedSection(String staffId, String year) {
        return sectionDao.findSelectedSection(staffId, year);
    }

    @Transactional
    @Override
    public void add(OrderBookVo orderBookVo) {
        String staffId = orderBookVo.getStaffId();
        Map forms = orderBookVo.getMap();
        Iterator iterator = forms.entrySet().iterator();

        while (iterator.hasNext()) {
            Map.Entry<String, String[]> form = (Map.Entry<String, String[]>) iterator.next();
            String[] items = form.getValue();

            int bookCount = (items.length - 1) / ITEMNUM;
            int j = 1;
            int secId = Short.valueOf(items[0]);
            for (int i = 0; i < bookCount; i++) {

                String bookTitle = items[j++].trim();
                String isbn = items[j++].trim();
                String dataOfPringting = items[j++].trim();
                String author = items[j++].trim();
                String press = items[j++].trim();
                String category = items[j++].trim();
                short unitPrice = 0;
                if (!items[j++].equals("")) {
                    unitPrice = Short.valueOf(items[j - 1]);
                }
                String remark = items[j++].trim();

                Book book = new Book();
                book.setBookTitle(bookTitle);
                book.setIsbn(isbn);
                book.setDateOfPrinting(dataOfPringting);
                book.setAuthor(author);
                book.setPress(press);
                book.setCategory(category);
                book.setUnitPrice(unitPrice);

                OrderBook orderBook = new OrderBook();
                orderBook.setIsbn(isbn);
                orderBook.setBookTitle(bookTitle);
                orderBook.setStaffId(staffId);
                orderBook.setRemark(remark);
                orderBook.setSecId(secId);
                orderBook.setApproval(false);

                orderBookDao.add(orderBook);
                if (bookDao.find(bookTitle, isbn) == null)
                    bookDao.add(book);

            }
        }

    }

    @Override
    public List<AddedBookVo> findAddedBookInfoList(String staffId) {
        return orderBookDao.findAddedBookInfoList(staffId);
    }

    @Transactional
    @Override
    public void update(ChangedItems changedItems, String staffId) {
        boolean usedByOtherSec = false;
        int secId = changedItems.getSecID();
        List<ChangedItems.AlterItem> alterItemList = changedItems.getAlterItemList();


        String bookTitle;
        String isbn;
        Iterator iterator = alterItemList.iterator();
        while (iterator.hasNext()) {
            ChangedItems.AlterItem alterItem = (ChangedItems.AlterItem) iterator.next();

            bookTitle = alterItem.getBookTitle();
            isbn = alterItem.getIsbn();

            if (orderBookDao.usedByOtherSec(bookTitle, isbn, secId) == 1) {
                usedByOtherSec = true;
            }

            String newBookTitle = alterItem.getNewBookTitle();
            String newIsbn = alterItem.getNewIsbn();
            String newDateOfPrinting = alterItem.getNewDateOfPrinting();
            String newAuthor = alterItem.getNewAuthor();
            String newPress = alterItem.getNewPress();
            String newCategory = alterItem.getNewCategory();
            String temp = alterItem.getNewUnitPrice();
            String newRemark = alterItem.getNewRemark();
            short newUnitPrice = 0;

            if (!temp.equals("")) {
                newUnitPrice = Short.valueOf(temp);
            }
            Book book = new Book();
            book.setBookTitle(newBookTitle);
            book.setIsbn(newIsbn);
            book.setDateOfPrinting(newDateOfPrinting);
            book.setAuthor(newAuthor);
            book.setPress(newPress);
            book.setCategory(newCategory);
            book.setUnitPrice(newUnitPrice);
            if (!usedByOtherSec)
                bookDao.delete(bookTitle, isbn);
            //TODO 以下代码写的很垃圾，用来判断图书存在
            if (bookDao.find(newBookTitle, newIsbn) == null)
                bookDao.add(book);
            orderBookDao.delete(secId, bookTitle, isbn);
            OrderBook orderBook = new OrderBook();
            orderBook.setSecId(secId);
            orderBook.setStaffId(staffId);
            orderBook.setIsbn(newIsbn);
            orderBook.setBookTitle(newBookTitle);
            orderBook.setRemark(newRemark);
            orderBookDao.add(orderBook);

        }
        List<ChangedItems.DeleteItem> deleteItemList = changedItems.getDeleteItemList();
        iterator = deleteItemList.iterator();
        while (iterator.hasNext()) {
            ChangedItems.DeleteItem deleteItem = (ChangedItems.DeleteItem) iterator.next();
            isbn = deleteItem.getIsbn();
            bookTitle = deleteItem.getBookTitle();

            orderBookDao.delete(secId, bookTitle, isbn);
            if (!usedByOtherSec)
                bookDao.delete(bookTitle, isbn);
        }

    }

    @Override
    public void audit(List<OrderBookReviewVo> orderBookReviewVoList) {
        Iterator iterator = orderBookReviewVoList.iterator();
        while (iterator.hasNext()) {
            OrderBookReviewVo orderBookReviewVo = (OrderBookReviewVo) iterator.next();
            int secId = orderBookReviewVo.getSecId();
            String bookTitle = orderBookReviewVo.getBookTitle();
            String isbn = orderBookReviewVo.getIsbn();
            orderBookDao.audit(secId, bookTitle, isbn);
        }
    }

    @Override
    public List<OrderBookReviewVo> findAllNotReviewedBook() {
        List<OrderBookReviewVo> orderBookReviewVoList = orderBookDao.findAllNotReviewedBook();
        Iterator iterator = orderBookReviewVoList.iterator();
        while (iterator.hasNext()) {
            OrderBookReviewVo temp = (OrderBookReviewVo) iterator.next();
            int secId = temp.getSecId();
            int stdCount = takesDao.getStdCountInSection(secId);
            temp.setStdCount(stdCount);
        }

        return orderBookReviewVoList;
    }

}
