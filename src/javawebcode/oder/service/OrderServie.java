package jk2.javawebcode.oder.service;

import cn.itcast.jdbc.JdbcUtils;
import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;
import jk2.javawebcode.oder.dao.OrederDao;
import jk2.javawebcode.oder.domain.Order;
import jk2.javawebcode.page.PageBean;
import jk2.javawebcode.user.dao.Userdao;
import jk2.javawebcode.user.domain.User;
import jk2.javawebcode.user.service.UseService;

import javax.mail.MessagingException;
import javax.mail.Session;
import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

public class OrderServie {
    private OrederDao orederDao= new OrederDao();
    private UseService useService = new UseService();
    /**
     * 按照用户id查询订单
     * @param uid
     * @param curpage
     * @return
     */
    public PageBean<Order> findByUid(String uid, int curpage){
        try {
            return orederDao.findbByUid(uid, curpage);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public PageBean<Order> findAll( int curpage){
        try {
            return orederDao.findAll(curpage);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * 生成订单
     * @param order
     */
    public void insertIntoSql(Order order){
        try {
            JdbcUtils.beginTransaction();
            orederDao.insertOrder(order);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
    }
    public Order findbyOid(String oid){
        try {
            return orederDao.findbyOid(oid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 付款
     * @param oid
     */
    public void Pay(String oid){
        try {
            JdbcUtils.beginTransaction();
            orederDao.StatusToPay(oid);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
    }

    /**
     * 发货
     * @param oid
     */
    public void faHuo(String oid, String uid){
        try {
            JdbcUtils.beginTransaction();
            orederDao.StatusToAck(oid);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
        //查询用户邮箱
        User user = useService.findbyUid(uid);
        String toemail = user.getEmail();
        Properties prop = new Properties();
        try {
            prop.load(this.getClass().getClassLoader().getResourceAsStream("email_ackgoods.properties"));
        } catch (IOException e1) {
            throw new RuntimeException(e1);
        }
        String host = prop.getProperty("host");//服务器主机名
        String name = prop.getProperty("username");//登录名
        String pass = prop.getProperty("password");//登录密码
        Session session = MailUtils.createSession(host, name, pass);

        String from = prop.getProperty("from");
        String subject = prop.getProperty("subject");
        String content = MessageFormat.format(prop.getProperty("content"), oid);
        Mail mail = new Mail(from, toemail, subject, content);
        try {
            MailUtils.send(session, mail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * （确认收获）交易完成
     * @param oid
     */
    public void Accomplish(String oid){
        try {
            JdbcUtils.beginTransaction();
            orederDao.StatusToAccomplish(oid);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
    }

    /**
     * 取消订单
     * @param oid
     */
    public void cancelOrder(String oid){
        try {
            JdbcUtils.beginTransaction();
            orederDao.cancelOrder(oid);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
    }

    /**
     * 未付款订单（后端页面）
     * @param curpage
     * @return
     */
    public PageBean<Order> findNotPayOreders(int curpage) {
        PageBean<Order> orderPageBean = null;
        try {
            JdbcUtils.beginTransaction();
            orderPageBean = orederDao.notPayOrders(curpage);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
        return orderPageBean;
    }

    /**
     * 已付款订单（后端页面）
     * @param curpage
     * @return
     */
    public PageBean<Order> findPayOreders(int curpage) {
        PageBean<Order> orderPageBean = null;
        try {
            JdbcUtils.beginTransaction();
            orderPageBean = orederDao.payOrders(curpage);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
        return orderPageBean;
    }

    /**
     * 未发货订单（后端页面）
     * @param curpage
     * @return
     */
    public PageBean<Order> findNotFahuoOreders(int curpage) {
        PageBean<Order> orderPageBean = null;
        try {
            JdbcUtils.beginTransaction();
            orderPageBean = orederDao.notFaHuoOrders(curpage);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
        return orderPageBean;
    }

    /**
     * 完成交易订单（后端页面）
     * @param curpage
     * @return
     */
    public PageBean<Order> findAccomOreders(int curpage) {
        PageBean<Order> orderPageBean = null;
        try {
            JdbcUtils.beginTransaction();
            orderPageBean = orederDao.accomplishOrders(curpage);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
        return orderPageBean;
    }

    /**
     * 被取消的订单（后端页面）
     * @param curpage
     * @return
     */
    public PageBean<Order> findCacelOrders(int curpage) {
        PageBean<Order> orderPageBean = null;
        try {
            JdbcUtils.beginTransaction();
            orderPageBean = orederDao.cancelOrders(curpage);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
        return orderPageBean;
    }

    public void deleteOrder(String oid) {
        try {
            JdbcUtils.beginTransaction();
            orederDao.deleteOrder(oid);
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try{
                JdbcUtils.rollbackTransaction();
            }catch (SQLException e1){}
            throw new RuntimeException(e);
        }
    }
}
