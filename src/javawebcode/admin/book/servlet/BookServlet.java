package jk2.javawebcode.admin.book.servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import jk2.javawebcode.book.service.BookService;
import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.category.domain.Category;
import jk2.javawebcode.category.service.CategoryService;
import jk2.javawebcode.page.PageBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

@WebServlet("/AdminBookServlet")
public class BookServlet extends BaseServlet {
    private BookService bookService = new BookService();
    private CategoryService categoryService = new CategoryService();

    /**
     * 编辑图书
     * @param req
     * @param resp
     * @return
     */
    public String edite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map parameterMap = req.getParameterMap();
        //所属分类
        Category category = CommonUtils.toBean(parameterMap, Category.class);
        //封装商品对象
        Book book = CommonUtils.toBean(parameterMap, Book.class);
        //设置商品所属分类
        book.setCategory(category);
        bookService.edite(book);
        req.setAttribute("msg", "修改图书成功");
        return "f:/adminjsps/msg.jsp";
    }

    /**
     * 删除图书
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String deleteBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取商品id
        String bid = req.getParameter("bid");
        Book book = bookService.findByBid(bid);
        String savePeth = this.getServletContext().getRealPath("/book_img");
//        int pathIndex = savePeth.indexOf("\\out");
//        savePeth = savePeth.substring(0,pathIndex);
//        savePeth = savePeth + "\\Web\\";
        //删除图片
        new File(savePeth, book.getImage_b()).delete();
        new File(savePeth, book.getImage_w()).delete();
        bookService.deleteBook(bid);
        req.setAttribute("msg", "删除图书成功");
        return "f:/adminjsps/msg.jsp";
    }
    /**
     * 查询所有分类，返回一级分类
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findall(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> firstCategory = categoryService.findall();
        req.setAttribute("firstCategory", firstCategory);
        return "f:/adminjsps/admin/book/left.jsp";
    }

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
        List<Category> categoryList = categoryService.findParent();
        req.setAttribute("parentList", categoryList);
        String pid = book.getCategory().getParent().getCid();
        List<Category> childList = categoryService.findChid(pid);
        req.setAttribute("chiList", childList);
        return "f:/adminjsps/admin/book/desc.jsp";
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
        return "f:/adminjsps/admin/book/list.jsp";
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
        return "f:/adminjsps/admin/book/list.jsp";
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
        String cid = req.getParameter("cid");
        PageBean<Book> pageBean = bookService.findByCategory(cid, curage);
        String url = Geturl(req);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/adminjsps/admin/book/list.jsp";
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
        return "f:/adminjsps/admin/book/list.jsp";
    }

    /**
     * 查询所有一级分类(添加图书）
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findParent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categoryList = categoryService.findParent();
        req.setAttribute("parentList", categoryList);
        return "f:/adminjsps/admin/book/add.jsp";
    }
    public String ajxfindChid(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pid = req.getParameter("pid");
        List<Category> chilList = categoryService.findChid(pid);
        String json = ListToJson(chilList);
        resp.getWriter().print(json);
        return null;
    }

    private String ListToJson(List<Category> chilList) {
        StringBuilder json = new StringBuilder("[");
        int size = chilList.size();
        for(int i=0; i < size; i++){
            json.append(toJson(chilList.get(i)));
            if(i != size - 1)json.append(",");
        }
        json.append("]");
        return json.toString();
    }

    private String toJson(Category  category) {
        StringBuilder one = new StringBuilder("{");
        one.append("\"cid\"").append(":").append("\"").append(category.getCid()).append("\"");
        one.append(",").append("\"cname\"").append(":").append("\"").append(category.getCname()).append("\"").append("}");
        return one.toString();
    }

}
