package jk2.javawebcode.book.dao;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;
import jk2.javawebcode.CartItem.domain.CartItem;
import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.category.domain.Category;
import jk2.javawebcode.page.PageConfigue;
import jk2.javawebcode.page.SQLExpresion;
import jk2.javawebcode.page.PageBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BookDao {
    private QueryRunner que = new TxQueryRunner();

    /**
     * 按照商品编号查找
     * @param bid
     * @return
     * @throws SQLException
     */
    public Book findByBid(String bid) throws SQLException {
        String sql = "select b.*, c.pid from t_book b, t_category c where bid=? and b.cid=c.cid";
        Map<String, Object> map = que.query(sql, new MapHandler(), bid);
        Book book = CommonUtils.toBean(map, Book.class);
        Category category = CommonUtils.toBean(map, Category.class);
        if (map.get("pid") != null){
            Category pare = new Category();
            pare.setCid((String) map.get("pid"));
            category.setParent(pare);
        }
        book.setCategory(category);
        return book;
    }

    /**
     * 按照作者查询
     * @param author
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Book> findByAuthor(String author, int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        conList.add(new SQLExpresion("author", "like", "%"+author+"%"));
        return findBycondition(conList, curpage);
    }

    /**
     * 按照出版社模糊查询
     * @param press
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Book> findByPress(String press, int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        conList.add(new SQLExpresion("press", "like", "%"+press+"%"));
        return findBycondition(conList, curpage);
    }
    /**
     * 按照分类查找
     * @param cateId
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Book> findByCategory(String cateId, int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        //设置条件子句
        conList.add(new SQLExpresion("cid", "=", cateId));
        return findBycondition(conList, curpage);
    }
    /**
     *按照书名模糊查询
     * @param bname
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Book> findbByName(String bname, int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        conList.add(new SQLExpresion("bname", "like", "%"+bname+"%"));
        return findBycondition(conList, curpage);
    }
    /**
     * 通用查询
     * @param conList（条件列表）
     * @param curpage （当前页）
     * @return
     */
    public PageBean<Book> findBycondition(List<SQLExpresion> conList, int curpage) throws SQLException {
        PageBean<Book> page = new PageBean<Book>();
        //获取分页大小
        int pageRecord = PageConfigue.PageBookSize;
        //根据条件生成where子句，并添加相应参数
        StringBuilder where = new StringBuilder("where 1 = 1");
        List<Object> parames = new ArrayList<Object>();
        for(SQLExpresion condition:conList){
            where.append(" and ").append(condition.getName()).append(" ").append(condition.getOperate()).append(" ");
            if(!condition.getOperate().equals("is null")){
                where.append("?");
                parames.add(condition.getParame());
            }
        }
        String sql = "select count(*) from t_book " + where;
        Number number = (Number) que.query(sql, new ScalarHandler(), parames.toArray());
        sql = "select * from t_book " + where + "order by orderBy limit ?, ?";
        //分页物品所在区间
        parames.add((curpage - 1)*pageRecord);
        parames.add(pageRecord);
        List<Book> bookList = que.query(sql, new BeanListHandler<Book>(Book.class), parames.toArray());
        //共有多少页
        int totalRecord = number.intValue();
        int a = totalRecord/pageRecord;
        if(totalRecord%pageRecord != 0){
            a += 1;
        }
        page.setCurPage(curpage);
        page.setPageRecord(pageRecord);
        page.setBeanList(bookList);
        page.setTotalRecord(number.intValue());
        page.setTotalPage(a);
        return page;
    }

    /**
     * 添加图书
     * @param book
     */
    public void addBook(Book book) throws SQLException {
        String sql = "insert into t_book(bid,bname,author,price,currPrice," +
                "discount,press,publishtime,edition,pageNum,wordNum,printtime," +
                "booksize,paper,cid,image_w,image_b)" +
                " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] params = {book.getBid(),book.getBname(),book.getAuthor(),
                book.getPrice(),book.getCurrPrice(),book.getDiscount(),
                book.getPress(),book.getPublishtime(),book.getEdition(),
                book.getPageNum(),book.getWordNum(),book.getPrinttime(),
                book.getBooksize(),book.getPaper(), book.getCategory().getCid(),
                book.getImage_w(),book.getImage_b()};
        que.update(sql, params);
    }

    /**
     * 编辑图书
     * @param book
     * @throws SQLException
     */
    public void edite(Book book) throws SQLException {
        String sql = "update t_book set bname=?, author=?, price=?, currPrice=?,"+
                "discount=?, press=?, publishtime=?, edition=?, pageNum=?, wordNum=?, printtime=?,"+
                "booksize=?, paper=?, cid=? where bid=?";
        Object[] params = {book.getBname(),book.getAuthor(),
                book.getPrice(),book.getCurrPrice(),book.getDiscount(),
                book.getPress(),book.getPublishtime(),book.getEdition(),
                book.getPageNum(),book.getWordNum(),book.getPrinttime(),
                book.getBooksize(),book.getPaper(), book.getCategory().getCid(),book.getBid()};
        que.update(sql, params);
    }

    /**
     * 删除图书
     * @param bid
     */
    public void delete(String bid) throws SQLException {
        String sql = "delete from t_book where bid=?";
        que.update(sql, bid);
    }
}
