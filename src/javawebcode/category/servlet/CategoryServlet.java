package jk2.javawebcode.category.servlet;

import cn.itcast.servlet.BaseServlet;
import jk2.javawebcode.category.domain.Category;
import jk2.javawebcode.category.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends BaseServlet {
    private CategoryService categoryService = new CategoryService();

    /**
     * 查询所有分类，反回一级分类
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findall(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> firstCategory = categoryService.findall();
        req.setAttribute("firstCategory", firstCategory);
        return "f:/jsps/left.jsp";
    }
}
