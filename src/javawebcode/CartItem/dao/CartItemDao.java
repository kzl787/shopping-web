package jk2.javawebcode.CartItem.dao;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;
import jk2.javawebcode.CartItem.domain.CartItem;
import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.user.domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CartItemDao {
    private QueryRunner que = new TxQueryRunner();

    /**
     * 将订单map转换成订单类
     * @param mapList
     * @return
     */
    private List<CartItem> mapToCartitem(List<Map<String, Object>> mapList){
        if(mapList.size() == 0)return null;
        List<CartItem> cartItems = new ArrayList<CartItem>();
        for(Map<String, Object> map: mapList){
            User user = new User();
            user.setUid((String) map.get("uid"));
            Book book = CommonUtils.toBean(map, Book.class);

            CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
            BigDecimal b1 = new BigDecimal(book.getCurrPrice() + "");
            BigDecimal b2 = new BigDecimal(cartItem.getNumber() + "");
            BigDecimal totalPrice = b1.multiply(b2);
            cartItem.setTotalPrice(totalPrice.doubleValue());
            cartItem.setBook(book);
            cartItem.setUser(user);
            cartItems.add(cartItem);
        }
        return cartItems;
    }

    private CartItem maptoItem(Map<String, Object> map){
        Book book = CommonUtils.toBean(map, Book.class);
        CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
        BigDecimal b1 = new BigDecimal(book.getCurrPrice() + "");
        BigDecimal b2 = new BigDecimal(cartItem.getNumber() + "");
        BigDecimal totalPrice = b1.multiply(b2);
        cartItem.setTotalPrice(totalPrice.doubleValue());
        cartItem.setBook(book);
        return cartItem;
    }
    /**
     * 通过用户id查找该用户的订单
     * @param uid
     * @return
     * @throws SQLException
     */
    public List<CartItem> findbyUid(String uid) throws SQLException {
        String sql = "select c.cartItemId, c.number, b.* from t_cartItem c, t_book b where uid=? and c.bid=b.bid order by orderBy";
        List<Map<String, Object>> mapList= que.query(sql, new MapListHandler(), uid);
        List<CartItem> cartItems = mapToCartitem(mapList);
        return cartItems;
    }

    /**
     * 查询是否存在订单
     * @param bid
     * @param uid
     * @return
     * @throws SQLException
     */
    public boolean findbbyUidAndBid(String bid, String uid) throws SQLException {
        String sql = "select count(*) from t_cartItem where uid=? and bid=?";
        Number number = (Number) que.query(sql, new ScalarHandler(), uid, bid);
        return number.intValue() > 0;
    }

    /**
     * 修改订单
     * @param bid
     * @param uid
     * @param number
     * @throws SQLException
     */
    public void alterItem(String bid, String uid, int number) throws SQLException {
        String sql = "update t_cartItem set number=number+? where uid=? and bid=?";
        que.update(sql, number, uid, bid);
    }

    /**
     * 修改订单到指定数量
     * @param cartId
     * @param number
     * @throws SQLException
     */
    public CartItem updateNumber(String cartId, int number) throws SQLException {
        String sql = "update t_cartItem set number=? where cartItemId=?";
        que.update(sql, number, cartId);
        sql = "select c.cartItemId,c.number, b.* from t_cartItem c, t_book b where cartItemId=? and c.bid=b.bid";
        Map<String, Object> map = que.query(sql, new MapHandler(), cartId);
        CartItem cartItem = maptoItem(map);
        return cartItem;
    }
    /**
     * 插入新的订单
     * @param cartItem
     * @throws SQLException
     */
    public void insertCartItem(CartItem cartItem) throws SQLException {
        String cartid = cartItem.getCartItemId();
        int number = cartItem.getNumber();
        String bid = cartItem.getBook().getBid();
        String uid = cartItem.getUser().getUid();
        String sql = "insert into t_cartItem(cartItemId,number,bid,uid) values (?,?,?,?)";
//        Object[] params = {cartid, number, bid, uid};
        que.update(sql, cartid, number, bid, uid);
    }

    /**
     * 删除订单（可删除单个或者多个）
     * @param itemsId
     * @throws SQLException
     */
    public void deleteItems(String itemsId) throws SQLException {
        Object[] itemArray = itemsId.split(",");
        StringBuilder w = new StringBuilder("where cartItemId in(");
        int len = itemArray.length;
        for (int i = 0; i < len; i++){
            w.append("?");
            if(i != len - 1){
                w.append(",");
            }
        }
        w.append(")");
        String sql = "delete from t_CartItem " + w.toString();
        que.update(sql, itemArray);
    }

    /**
     * 加载购买物品
     * @param cartItemIds
     * @return
     * @throws SQLException
     */
    public List<CartItem> CartItems(String cartItemIds) throws SQLException {
        Object[] cartItemIdArray = cartItemIds.split(",");
        StringBuilder where = new StringBuilder("cartItemId in(");
        int length = cartItemIdArray.length;
        for(int i = 0; i < length; i++) {
            where.append("?");
            if(i < length - 1) {
                where.append(",");
            }
        }
        where.append(")");
        String whereSql = where.toString();

        String sql = "select * from t_cartitem c, t_book b where c.bid=b.bid and " + whereSql;
        return toCartItemList(que.query(sql, new MapListHandler(), cartItemIdArray));
    }

    private  List<CartItem> toCartItemList(List<Map<String, Object>> mapList){
        List<CartItem> cartItemList = new ArrayList<CartItem>();
        for(Map<String, Object> map: mapList) {
            if (map == null || map.size() == 0) continue;
            CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
            Book book = CommonUtils.toBean(map, Book.class);
            User user = CommonUtils.toBean(map, User.class);
            cartItem.setBook(book);
            cartItem.setUser(user);
            BigDecimal b1 = new BigDecimal(book.getCurrPrice() + "");
            BigDecimal b2 = new BigDecimal(cartItem.getNumber() + "");
            BigDecimal totalPrice = b1.multiply(b2);
            cartItem.setTotalPrice(totalPrice.doubleValue());
            cartItemList.add(cartItem);
        }
        return cartItemList;
    }
}
