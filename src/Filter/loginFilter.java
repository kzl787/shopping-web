package Filter;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(
        filterName = "loginFilter",
        urlPatterns = {"/jsps/cart/*", "/jsps/order/*", "/CartItemServlet", "/OrderServlet"}
)
public class loginFilter implements Filter {
    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        Object user = req.getSession().getAttribute("sessionUser");
        if(user == null) {
            req.setAttribute("code", "error");
            req.setAttribute("msg", "您还没有登录，不能访问本资源");
            req.getRequestDispatcher("/jsps/msg.jsp").forward(req, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {

    }
}
