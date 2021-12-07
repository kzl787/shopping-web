package jk2.javawebcode.admin.order.servlet;

import cn.itcast.servlet.BaseServlet;
import jk2.javawebcode.oder.domain.Order;
import jk2.javawebcode.oder.service.OrderServie;
import jk2.javawebcode.page.PageBean;
import jk2.javawebcode.user.domain.User;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminOrderServlet")
public class AdminOrderServlet extends BaseServlet {
    private OrderServie orderServie = new OrderServie();

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
     * 查询所有订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        //获取分页对象
        PageBean<Order> pageBean = orderServie.findAll(curpage);
        //设置分页url
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/adminjsps/admin/order/list.jsp";
    }

    /**
     * 通过oid查询订单详情
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findbyOid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oid = req.getParameter("oid");
        Order order = orderServie.findbyOid(oid);
        req.setAttribute("order", order);
        req.setAttribute("a", req.getParameter("a"));
        return "f:/adminjsps/admin/order/desc.jsp";
    }
    /**
     * 查找未付款的订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findNotPayOreder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        PageBean<Order> pageBean = orderServie.findNotPayOreders(curpage);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/adminjsps/admin/order/list.jsp";
    }
    /**
     * 查询已付款的订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findHavePayOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        PageBean<Order> pageBean = orderServie.findPayOreders(curpage);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/adminjsps/admin/order/list.jsp";
    }
    /**
     * 查询未发货的订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findNotfahuoOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        PageBean<Order> pageBean = orderServie.findNotFahuoOreders(curpage);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/adminjsps/admin/order/list.jsp";
    }
    /**
     * 查询交易成功的订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findAcccomOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        PageBean<Order> pageBean = orderServie.findAccomOreders(curpage);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/adminjsps/admin/order/list.jsp";
    }
    /**
     * 查询被取消的订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findCancelOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        PageBean<Order> pageBean = orderServie.findCacelOrders(curpage);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/adminjsps/admin/order/list.jsp";
    }

    /**
     * 发货
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String fahuo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取订单编号和下单用户id
        String oid = req.getParameter("oid");
        String uid = req.getParameter("uid");
        orderServie.faHuo(oid, uid);
        return findbyOid(req, resp);
    }

    /**
     * 取消订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String cancelOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oid = req.getParameter("oid");
        orderServie.cancelOrder(oid);
        return findbyOid(req, resp);
    }

    /**
     * 删除订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String deleteorder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oid = req.getParameter("oid");
        orderServie.deleteOrder(oid);
        return "f:/adminjsps/admin/order/list.jsp";
    }
}
