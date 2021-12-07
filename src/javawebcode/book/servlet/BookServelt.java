package jk2.javawebcode.book.servlet;

import cn.itcast.servlet.BaseServlet;
import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.book.service.BookService;
import jk2.javawebcode.page.PageBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;

@WebServlet("/BookServlet")
public class BookServelt extends BaseServlet {
    private BookService bookService = new BookService();

    /**
     * 获取当前页码（默认为第一页）
     * @param req
     * @return
     */
    private int getCurage(HttpServletRequest req){
        int curage = 1;
        String age = req.getParameter("curpage");
        if(age != null && !age.trim().isEmpty()){
            try{
                curage = Integer.parseInt(age);
            }catch (RuntimeException e){}
        }
        return curage;
    }
    private String Geturl(HttpServletRequest req){
        String url = req.getRequestURI() +"?" +req.getQueryString();
        int index = url.lastIndexOf("&curpage=");
        if(index != -1){
            url = url.substring(0, index);
        }
        return url;
    }

    /**
     * 按商品编号查找
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findbyBid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bid = req.getParameter("bid");
        Book book = bookService.findByBid(bid);
        req.getSession().setAttribute("book", book);
        return "f:/jsps/book/desc.jsp";
    }
    /**
     * 根据作者模糊查询
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findbyAuthor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        String author = null;
        int index = url.lastIndexOf("&author=");
        if(index != -1){
            author = url.substring(index+8,url.length());
            author = URLDecoder.decode(author, "utf-8");
        }
        PageBean<Book> pageBean = bookService.findByAuthor(author, curpage);

        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/jsps/book/list.jsp";
    }

    /**
     * 按出版社名模糊查找
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findbyPress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        String press = null;
        int index = url.lastIndexOf("&press=");
        if(index != -1){
            press = url.substring(index+7,url.length());
            press = URLDecoder.decode(press, "utf-8");
        }
        PageBean<Book> pageBean = bookService.findByPress(press, curpage);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/jsps/book/list.jsp";
    }
    /**
     * 根据分类查找
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curage = getCurage(req);
        //获取分类编号
        String cid = req.getParameter("cid");
        //获取分页对象的实体列表
        PageBean<Book> pageBean = bookService.findByCategory(cid, curage);
        //获取分页的url
        String url = Geturl(req);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/jsps/book/list.jsp";
    }

    /**
     * 根据书名模糊搜索
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findbyName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curage = getCurage(req);
        String bname = req.getParameter("bname");
        PageBean<Book> pageBean = bookService.findbByName(bname, curage);
        String url = Geturl(req);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/jsps/book/list.jsp";
    }
}
