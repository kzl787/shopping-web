package jk2.javawebcode.oder.servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import jk2.javawebcode.CartItem.Service.CartItemService;
import jk2.javawebcode.CartItem.domain.CartItem;
import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.oder.dao.OrederDao;
import jk2.javawebcode.oder.domain.Order;
import jk2.javawebcode.oder.domain.OrderItem;
import jk2.javawebcode.oder.service.OrderServie;
import jk2.javawebcode.page.PageBean;
import jk2.javawebcode.user.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/OrderServlet")
public class OrderServlet extends BaseServlet {
    private OrderServie orderServie = new OrderServie();
    private CartItemService cartItemService = new CartItemService();
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
     * 通过用户id查询所有订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findbyUid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curpage = getCurage(req);
        String url = Geturl(req);
        User user = (User) req.getSession().getAttribute("sessionUser");
        if(user == null)return null;
        PageBean<Order> pageBean = orderServie.findByUid(user.getUid(), curpage);
        pageBean.setUrl(url);
        req.setAttribute("PageBean", pageBean);
        return "f:/jsps/order/list.jsp";
    }

    /**
     * 生成订单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String creatOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //根据商品的编号生成对应的商品列表
        String cartItemIds = req. getParameter("cartItemIds");
        List<CartItem> cartItems = cartItemService.CartItems(cartItemIds);
        //计算订单价格
        double total = totalPrice(cartItems);
        //设置订单的id
        String oid = CommonUtils.uuid();
        List<OrderItem> orderItemList = getOrderItemList(cartItems, oid);
        //获取用户
        User user = (User) req.getSession().getAttribute("sessionUser");
        Order order = new Order();
        order.setOid(oid);
        //设置下单时间
        order.setOrdertime(String.format("%tF %<tT", new Date()));
        order.setTotal(total);
        //设置订单状态（未付款）
        order.setStatus(1);
        //设置订单地址
        order.setAddress(req.getParameter("address"));
        order.setUser(user);
        order.setOrderItemList(orderItemList);
        //转发处理
        orderServie.insertIntoSql(order);
        req.setAttribute("oid", oid);
        req.setAttribute("total", total);
        req.setAttribute("address", order.getAddress());
        cartItemService.deletegoods(cartItemIds);
        return "f:/jsps/order/ordersucc.jsp";
    }

    private List<OrderItem> getOrderItemList(List<CartItem> cartItems, String oid) {
        if(cartItems.size() == 0)return null;
        List<OrderItem> orderItemList = new ArrayList<>();
        for(CartItem cartItem: cartItems){
            OrderItem orderItem = new OrderItem();
            orderItem.setOrederItemId(CommonUtils.uuid());
            orderItem.setBook(cartItem.getBook());
            orderItem.setQuantity(cartItem.getNumber());
            orderItem.setSubtotal(cartItem.getTotalPrice());
            orderItem.setBname(cartItem.getBook().getBname());
            orderItem.setCurrPrice(cartItem.getBook().getCurrPrice());
            orderItem.setImage_b(cartItem.getBook().getImage_b());
            Order order = new Order();
            order.setOid(oid);
            orderItem.setOrder(order);
            orderItemList.add(orderItem);
        }
        return orderItemList;
    }

    /**
     * 得到订单的总价格
     * @param cartItems
     * @return
     */
    private double totalPrice(List<CartItem> cartItems){
        if(cartItems.size() == 0)return 0;
        BigDecimal total = new BigDecimal("0");
        for(CartItem cartItem: cartItems){
            BigDecimal totalPrice = new BigDecimal(cartItem.getTotalPrice() + "");
            total = total.add(totalPrice);
        }
        return total.doubleValue();
    }

    /**
     *查看订单
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
        return "f:/jsps/order/desc.jsp";
    }

    /**
     * 付款
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String pay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oid = req.getParameter("oid");
        orderServie.Pay(oid);
        return "f:/jsps/order/pay.jsp";
    }

    /**
     * 确认收货
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String accomplish(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oid = req.getParameter("oid");
        orderServie.Accomplish(oid);
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
}

