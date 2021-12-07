package jk2.javawebcode.user.servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import jk2.javawebcode.user.domain.User;
import jk2.javawebcode.user.service.UseService;
import jk2.javawebcode.user.service.exception.UserException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
    private UseService useService = new UseService();

    /**
     * 登录
     * @param req
     * @param resp
     * @return
     */
    public String login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User logUser = CommonUtils.toBean(req.getParameterMap(), User.class);
        Map<String, String> error = loginvalidateall(logUser, req.getSession());
        //校验是否错误
        if(error.size() > 0){
            req.setAttribute("loginForm", logUser);
            req.setAttribute("error", error);
            return "f:/jsps/user/login1.jsp";
        }
        try {//校验用户命名和密码
            User user = useService.checkNamePass(logUser);
            //账号密码通过且用户已激活：保存用户到session和cookie中
            req.getSession().setAttribute("sessionUser", user);
            String loginname = URLEncoder.encode(logUser.getLoginname(), "utf-8");
            Cookie cookie =  new Cookie("loginname", loginname);
            cookie.setMaxAge(60 * 60 * 24 * 10);
            resp.addCookie(cookie);
            return "r:/index.jsp";
        } catch (UserException e) {
            req.setAttribute("msg", e.getMessage());//用户名或密码错误、或未激活
            req.setAttribute("loginForm", logUser);
            return "f:/jsps/user/login1.jsp";
        }
    }

    /**
     * 注册
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //封装表单对象
        User user = CommonUtils.toBean(req.getParameterMap(), User.class);
        //校验
        Map<String, String> error = registvalidateall(user, req.getSession());
        if(error.size() > 0){
            req.setAttribute("form", user);
            req.setAttribute("error", error);
            return "f:/jsps/user/regist.jsp";
        }
        //调用功能模块完成注册
        useService.regist(user);
        //跳转页面
        req.setAttribute("code", "success");
        req.setAttribute("msg", "注册成功，请点击邮件中的链接进行激活！ ");
        return "f:/jsps/msg.jsp";
    }

    public String quit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        return"r:/index.jsp";
    }
    /**
     * 修改密码
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String alterpass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("sessionUser");
        if(user == null)return"r:/index.jsp";
        User formuser = CommonUtils.toBean(req.getParameterMap(), User.class);
        Map<String, String> error = alterPasswordValidate(formuser, req.getSession());
        if(error.size() > 0){
            req.setAttribute("form", formuser);
            req.setAttribute("error", error);
            return "f:/jsps/user/pwd.jsp";
        }
        try {
            useService.alterpassword(user, formuser);
            req.setAttribute("msg", "修改密码成功");
            req.setAttribute("code", "success");
            req.getSession().removeAttribute("sessionUser");
            return "f:/jsps/msg.jsp";
        } catch (UserException e) {
            req.setAttribute("form", formuser);
            req.setAttribute("msg", e.getMessage());
            return "f:/jsps/user/pwd.jsp";
        }
    }

    /**
     * 用户名是否存在
     * @param req
     * @param resp
     * @return null
     * @throws ServletException
     * @throws IOException
     */
    public String ajxvalidateloginname(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginname = req.getParameter("loginname");
        boolean res = useService.ajxValidateloginname(loginname);
        resp.getWriter().print(res);
        return null;
    }

    /**
     * 邮箱是否被注册
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String ajxvalidateeamil(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        boolean res = useService.ajxValidateemail(email);
        resp.getWriter().print(res);
        return null;
    }

    /**
     * 验证码是否正确
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String ajxvalidateverifyCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String verifyCode = req.getParameter("verifyCode");
        String vcode = (String) req.getSession().getAttribute("vCode");
        boolean a = verifyCode.equalsIgnoreCase(vcode);
        resp.getWriter().print(a);
        return null;
    }

    /**
     * 激活
     * @param req
     * @param resp
     * @return /jsps/msg.jsp
     */
    public String activate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("activationCode");
        try {
            useService.activate(code);
            req.setAttribute("msg", "激活成功，请马上登录！");
            req.setAttribute("code", "successs");
        } catch (UserException e) {
            req.setAttribute("msg", e.getMessage());
            req.setAttribute("code", "error");
        }
        return "f:/jsps/msg.jsp";
    }

    /**
     * 登录表单校验
     * @param user
     * @param sess
     * @return
     */
    private Map<String, String> loginvalidateall(User user, HttpSession sess){
        Map<String, String> error = new HashMap<String, String>();

        String loginname = user.getLoginname();
        if(loginname == null || loginname.trim().isEmpty()){
            error.put("loginname", "用户名不能为空");
        }
        else if(loginname.length() > 20 || loginname.length() < 3){
            error.put("loginname", "用户名长度必须在3~20之间");
        }

        String loginpass = user.getLoginpass();
        if(loginpass == null || loginpass.trim().isEmpty()){
            error.put("loginpass", "密码不能为空");
        }
        else if(loginpass.length() > 20 || loginpass.length() < 3){
            error.put("loginpass", "密码长度必须在3~20之间");
        }

//        String vcode = (String) sess.getAttribute("vCode");
//        String verifyCode = user.getVerifyCode();
//        if(verifyCode == null || verifyCode.trim().isEmpty()){
//            error.put("verifyCode", "验证码不能为空");
//        }
//        else if(!vcode.equalsIgnoreCase(verifyCode)){
//            error.put("verifyCode", "验证码错误");
//        }
        return error;
    }
    /**
     * 注册表单校验
     * @param user
     * @param sess
     * @return
     */
    private Map<String, String> registvalidateall(User user, HttpSession sess){
        Map<String, String> error = new HashMap<String, String>();
        String loginname = user.getLoginname();
        if(loginname == null || loginname.trim().isEmpty()){
            error.put("loginname", "用户名不能为空");
        }
        else if(loginname.length() > 20 || loginname.length() < 3){
            error.put("loginname", "用户名长度必须在3~20之间");
        }
        else if(!useService.ajxValidateloginname(loginname)){
            error.put("loginname", "用户名已被注册");
        }

        String loginpass = user.getLoginpass();
        if(loginpass == null || loginpass.trim().isEmpty()){
            error.put("loginpass", "密码不能为空");
        }
        else if(loginpass.length() > 20 || loginpass.length() < 3){
            error.put("loginpass", "密码长度必须在3~20之间");
        }

        String reloginpass = user.getReloginpass();
        System.out.println(reloginpass);
        if(reloginpass == null || reloginpass.trim().isEmpty()){
            error.put("reloginpass", "确认密码不能为空");
        }
        else if(!reloginpass.equals(loginpass)){
            error.put("reloginpass", "两次输入密码不一致");
        }

        String email = user.getEmail();
        if(email == null || email.trim().isEmpty()){
            error.put("email", "邮箱不能为空");
        }
        else if(!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")){
            error.put("email", "邮箱格式错误");
        }
        else if(!useService.ajxValidateemail(email)){
            error.put("email", "邮箱已被注册");
        }

        String vcode = (String) sess.getAttribute("vCode");
        String verifyCode = user.getVerifyCode();
        if(verifyCode == null || verifyCode.trim().isEmpty()){
            error.put("verifyCode", "验证码不能为空");
        }
        else if(!vcode.equalsIgnoreCase(verifyCode)){
            error.put("verifyCode", "验证码错误");
        }
        return error;
    }
    private Map<String, String> alterPasswordValidate(User formuser, HttpSession sess) {
        Map<String, String> error = new HashMap<String, String>();
        String loginpass = formuser.getLoginpass();
        if(loginpass == null || loginpass.trim().isEmpty()){
            error.put("loginpass", "密码不能为空");
        }
        else if(loginpass.length() > 20 || loginpass.length() < 3){
            error.put("loginpass", "密码长度必须在3~20之间");
        }

        String newpass = formuser.getNewpass();
        if(newpass == null || newpass.trim().isEmpty()){
            error.put("newpass", "新密码不能为空");
        }
        else if(newpass.length() > 20 || newpass.length() < 3){
            error.put("newpass", "新密码长度必须在3~20之间");
        }

        String reloginpass = formuser.getReloginpass();
        if(reloginpass == null || reloginpass.trim().isEmpty()){
            error.put("reloginpass", "确认密码不能为空");
        }
        else if(!newpass.equals(reloginpass)){
            error.put("reloginpass", "两次密码输入不一致");
        }

        String vcode = (String) sess.getAttribute("vCode");
        String verifyCode = formuser.getVerifyCode();
        if(verifyCode == null || verifyCode.trim().isEmpty()){
            error.put("verifyCode", "验证码不能为空");
        }
        else if(!vcode.equalsIgnoreCase(verifyCode)){
            error.put("verifyCode", "验证码错误");
        }
        return error;
    }
}
