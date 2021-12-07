package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(
        filterName = "AdminLogFilter",
        urlPatterns = {"/adminjsps/admin/*", "/AddBookServlet", "/AdminBookServlet", "/AdminOrderServlet"}
)
public class AdminFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        Object user = req.getSession().getAttribute("sessionAdmin");
        if(user == null) {
            req.setAttribute("msg", "您没用权限访问本资源，请先登录管理员账号");
            req.getRequestDispatcher("/adminjsps/login.jsp").forward(req, servletResponse);
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
