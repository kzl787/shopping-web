package jk2.javawebcode.CartItem.Service;

import cn.itcast.commons.CommonUtils;
import jk2.javawebcode.CartItem.dao.CartItemDao;
import jk2.javawebcode.CartItem.domain.CartItem;

import java.sql.SQLException;
import java.util.List;

public class CartItemService {
    private CartItemDao cartItemDao = new CartItemDao();

    /**
     * 查询购物车物品
     * @param uid
     * @return
     */
    public List<CartItem> findbyUid(String uid){
        try {
            return cartItemDao.findbyUid(uid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 往购物车中添加商品
     * @param cartItem
     */
    public void addgoods(CartItem cartItem){
        String uid = cartItem.getUser().getUid();
        String bid = cartItem.getBook().getBid();
        try {
            //如果购物车中存在相同的商品，则修改商品条目的数量即可
            if(cartItemDao.findbbyUidAndBid(bid, uid)){
                cartItemDao.alterItem(bid, uid, cartItem.getNumber());
            }
            else{
                //如果不存在条目对象则创建新条目
                cartItem.setCartItemId(CommonUtils.uuid());
                cartItemDao.insertCartItem(cartItem);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 删除商品功能
     * @param itemsId
     */
    public void deletegoods(String itemsId){
        try {
            cartItemDao.deleteItems(itemsId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 修改订单到指定数量
     * @param cartItem
     */
    public CartItem updateNumber(CartItem cartItem){
        try {
            return cartItemDao.updateNumber(cartItem.getCartItemId(), cartItem.getNumber());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 展示购买物品
     * @param cartItemIds
     * @return
     */
    public List<CartItem> CartItems(String cartItemIds) {
        try {
            return cartItemDao.CartItems(cartItemIds);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
