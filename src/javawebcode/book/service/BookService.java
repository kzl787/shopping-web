package jk2.javawebcode.book.service;

import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.book.dao.BookDao;
import jk2.javawebcode.page.PageBean;

import java.sql.SQLException;

public class BookService {
    private BookDao bookdao = new BookDao();
    //按商品编号查询
    public Book findByBid(String bid) {
        try {
            return bookdao.findByBid(bid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //按作者模糊查询
    public PageBean<Book> findByAuthor(String author, int curpage){
        try {
            return bookdao.findByAuthor(author, curpage);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //按出版社模糊查询
    public PageBean<Book> findByPress(String press, int curpage){
        try {
            return bookdao.findByPress(press, curpage);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //按分类查询
    public PageBean<Book> findByCategory(String cateId, int curpage){
        try {
            return bookdao.findByCategory(cateId, curpage);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //按书名模糊查询
    public PageBean<Book> findbByName(String bname, int curpage){
        try {
            return bookdao.findbByName(bname, curpage);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 添加图书
     * @param book
     */
    public void addBook(Book book) {
        try {
            bookdao.addBook(book);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 修改图书
     * @param book
     */
    public void edite(Book book) {
        try {
            bookdao.edite(book);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteBook(String bid) {
        try {
            bookdao.delete(bid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
