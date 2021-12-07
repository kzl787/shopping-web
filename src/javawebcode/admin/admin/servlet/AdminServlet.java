package jk2.javawebcode.admin.admin.servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import jk2.javawebcode.admin.admin.domain.Admin;
import jk2.javawebcode.admin.admin.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
    private AdminService adminService = new AdminService();

    public String login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Admin formadmin = CommonUtils.toBean(req.getParameterMap(), Admin.class);
        Admin admin = adminService.login(formadmin);
        if(admin == null){
            req.setAttribute("msg", "用户名或密码错误");
            req.setAttribute("admin", formadmin);
            return "f:/adminjsps/login.jsp";
        }
        req.getSession().setAttribute("sessionAdmin", admin);
        return "r:/adminjsps/admin/index.jsp";
    }
}
