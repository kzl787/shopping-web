package jk2.javawebcode.oder.dao;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;
import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.oder.domain.Order;
import jk2.javawebcode.oder.domain.OrderItem;
import jk2.javawebcode.page.PageBean;
import jk2.javawebcode.page.PageConfigue;
import jk2.javawebcode.page.SQLExpresion;
import jk2.javawebcode.user.domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrederDao {
    private QueryRunner que = new TxQueryRunner();

    /**
     * 通过uid查询所有订单
     * @param uid
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Order> findbByUid(String uid, int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        conList.add(new SQLExpresion("uid", "=", uid));
        return findBycondition(conList, curpage);
    }
    /**
     * 通用查询
     * @param conList（条件列表）
     * @param curpage （当前页）
     * @return
     */
    public PageBean<Order> findBycondition(List<SQLExpresion> conList, int curpage) throws SQLException {
        PageBean<Order> page = new PageBean<Order>();
        int pageRecord = PageConfigue.PageOrderSize;
        StringBuilder where = new StringBuilder("where 1 = 1");
        List<Object> parames = new ArrayList<Object>();
        for(SQLExpresion condition:conList){
            where.append(" and ").append(condition.getName()).append(" ").append(condition.getOperate()).append(" ");
            if(!condition.getOperate().equals("is null")){
                where.append("?");
                parames.add(condition.getParame());
            }
        }
        String sql = "select count(*) from t_order " + where;
        Number number = (Number) que.query(sql, new ScalarHandler(), parames.toArray());
        sql = "select * from t_order " + where + " order by ordertime desc limit ?, ?";
        parames.add((curpage - 1)*pageRecord);
        parames.add(pageRecord);
        List<Map<String, Object>> mapList = que.query(sql, new MapListHandler(), parames.toArray());

        List<Order> orders = mapListToOrderList(mapList);


        int totalRecord = number.intValue();
        int a = totalRecord/pageRecord;
        if(totalRecord%pageRecord != 0){
            a += 1;
        }
        page.setCurPage(curpage);
        page.setPageRecord(pageRecord);
        page.setBeanList(orders);
        page.setTotalRecord(totalRecord);
        page.setTotalPage(a);
        return page;
    }
    private List<Order> mapListToOrderList(List<Map<String, Object>> mapList) throws SQLException {
        if(mapList == null)return null;
        List<Order> orders = new ArrayList<>();
        for(Map<String, Object> map: mapList){
            if(map.size() != 0) {
                Order order = CommonUtils.toBean(map, Order.class);
                User user = CommonUtils.toBean(map, User.class);
                String oid = (String) map.get("oid");
                order.setUser(user);
                order.setOrderItemList(Items(oid));
                orders.add(order);
            }
        }
        return orders;
    }

    private List<OrderItem> Items(String oid) throws SQLException {
        String sql = "select * from t_orderitem where oid=?";
        List<Map<String, Object>> maps = que.query(sql, new MapListHandler(), oid);
        return itemsListToOrderItems(maps);
    }

    private List<OrderItem> itemsListToOrderItems(List<Map<String, Object>> maps) {
        if(maps == null)return null;
        List<OrderItem> orderItems = new ArrayList<>();
        for(Map<String, Object> map: maps){
            if(map.size() != 0) {
                OrderItem orderItem = CommonUtils.toBean(map, OrderItem.class);
                Book book = CommonUtils.toBean(map, Book.class);
                Order order = CommonUtils.toBean(map, Order.class);
                orderItem.setBook(book);
                orderItem.setOrder(order);
                orderItems.add(orderItem);
            }
        }
        return orderItems;
    }

    /**
     * 添加订单
     * @param order
     */
    public void insertOrder(Order order) throws SQLException {
        String sql = "insert into t_order values(?, ?, ?, ?, ?, ?)";
        Object[] params = {order.getOid(), order.getOrdertime(), order.getTotal(), order.getStatus(),order.getAddress(),
        order.getUser().getUid()};
        que.update(sql, params);
        insertOrderItems(order.getOrderItemList());
    }

    /**
     * 插入订单项
     * @param orderItems
     * @throws SQLException
     */
    public void insertOrderItems(List<OrderItem> orderItems) throws SQLException {
        String sql = "insert into t_orderitem values (?,?,?,?,?,?,?,?)";
        for(OrderItem orderItem: orderItems){
                Object[] params = {orderItem.getOrederItemId(), orderItem.getQuantity(), orderItem.getSubtotal(), orderItem.getBook().getBid(),
                orderItem.getBname(), orderItem.getCurrPrice(), orderItem.getImage_b(), orderItem.getOrder().getOid()};
                que.update(sql, params);
        }
    }

    /**
     * 根据订单号查询订单
     * @param oid
     * @return
     * @throws SQLException
     */
    public Order findbyOid(String oid) throws SQLException {
        String sql = "select * from t_order where oid=?";
        Map map = que.query(sql, new MapHandler(), oid);
        Order order = CommonUtils.toBean(map, Order.class);
        User user = CommonUtils.toBean(map, User.class);
        order.setUser(user);
        order.setOrderItemList(Items(oid));
        return order;
    }

    /**
     * 付款
     * @param oid
     * @throws SQLException
     */
    public void StatusToPay(String oid) throws SQLException {
        String sql = "update t_order set status=2 where oid=?";
        que.update(sql, oid);
    }

    /**
     * 发货
     * @param oid
     * @throws SQLException
     */
    public void StatusToAck(String oid) throws SQLException {
        String sql = "update t_order set status=3 where oid=?";
        que.update(sql, oid);
    }

    /**
     * 确认收货
     * @param oid
     * @throws SQLException
     */
    public void StatusToAccomplish(String oid) throws SQLException {
        String sql = "update t_order set status=4 where oid=?";
        que.update(sql, oid);
    }

    /**
     * 取消订单
     * @param oid
     * @throws SQLException
     */
    public void cancelOrder(String oid) throws SQLException {
        String sql = "update t_order set status=5 where oid=?";
        que.update(sql, oid);
    }

    /**
     * 查询所有订单
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Order> findAll(int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        return findBycondition(conList, curpage);
    }

    /**
     * 查询未付款订单
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Order> notPayOrders(int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        conList.add(new SQLExpresion("status", "=", "1"));
        return findBycondition(conList, curpage);
    }

    /**
     * 查询已付款订单
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Order> payOrders(int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        //设置查询条件
        conList.add(new SQLExpresion("status", "=", "2"));
        return findBycondition(conList, curpage);
    }

    /**
     * 查询未发货订单
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Order> notFaHuoOrders(int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        conList.add(new SQLExpresion("status", "=", "3"));
        return findBycondition(conList, curpage);
    }

    /**
     * 查询交易成功的订单
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Order> accomplishOrders(int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        conList.add(new SQLExpresion("status", "=", "4"));
        return findBycondition(conList, curpage);
    }

    /**
     * 查询被取消订单
     * @param curpage
     * @return
     * @throws SQLException
     */
    public PageBean<Order> cancelOrders(int curpage) throws SQLException {
        List<SQLExpresion> conList = new ArrayList<SQLExpresion>();
        conList.add(new SQLExpresion("status", "=", "5"));
        return findBycondition(conList, curpage);
    }

    public void deleteOrder(String oid) throws SQLException {
        String sql = "delete from t_order where oid=?";
        que.update(sql, oid);
    }
}
