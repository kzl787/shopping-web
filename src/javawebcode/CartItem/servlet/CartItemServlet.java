package jk2.javawebcode.CartItem.servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import jk2.javawebcode.CartItem.Service.CartItemService;
import jk2.javawebcode.CartItem.domain.CartItem;
import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.user.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/CartItemServlet")
public class CartItemServlet extends BaseServlet {
    private CartItemService cartItemService= new CartItemService();

    /**
     * 通过用户id查询购物车物品功能
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findbyUid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("sessionUser");
        String uid = user.getUid();
        List<CartItem> cartItems = cartItemService.findbyUid(uid);
        req.setAttribute("cartItems", cartItems);
        return "f:/jsps/cart/list.jsp";
    }

    /**
     * 往购物车中添加商品
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String addGood(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //封装条目对象
        User user = (User) req.getSession().getAttribute("sessionUser");
        User user1= new User();
        user1.setUid(user.getUid());
        Book book = new Book();
        book.setBid(req.getParameter("bid"));
        CartItem cartItem = CommonUtils.toBean(req.getParameterMap(), CartItem.class);
        cartItem.setUser(user1);
        cartItem.setBook(book);
        //调用添加商品模型
        cartItemService.addgoods(cartItem);
        return findbyUid(req, resp);
    }

    /**
     * 删除物品
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String deleteGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemsId = req.getParameter("itemsId");
        cartItemService.deletegoods(itemsId);
        return findbyUid(req, resp);
    }

    /**
     * 修改商品数量
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String updateNumber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CartItem cartItem = CommonUtils.toBean(req.getParameterMap(), CartItem.class);
        cartItem = cartItemService.updateNumber(cartItem);
        StringBuilder sb = new StringBuilder("{");
        sb.append("\"number\"").append(":").append(cartItem.getNumber());
        sb.append(",");
        sb.append("\"totalPrice\"").append(":").append(cartItem.getTotalPrice());
        sb.append("}");
        resp.getWriter().print(sb);
        return null;
    }

    /**
     * 结算页面
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String jiesuan(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String cartItemIds = req.getParameter("cartItemIds");
        double total = Double.parseDouble(req.getParameter("total"));
        List<CartItem> cartItemList = cartItemService.CartItems(cartItemIds);
        req.setAttribute("cartItemList", cartItemList);
        req.setAttribute("total", total);
        req.setAttribute("cartItemIds", cartItemIds);
        return "f:/jsps/cart/showitem.jsp";
    }
}
