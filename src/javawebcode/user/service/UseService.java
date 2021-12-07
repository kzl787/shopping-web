package jk2.javawebcode.user.service;

import cn.itcast.commons.CommonUtils;
import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;
import jk2.javawebcode.user.dao.Userdao;
import jk2.javawebcode.user.domain.User;
import jk2.javawebcode.user.service.exception.UserException;

import javax.mail.MessagingException;
import javax.mail.Session;
import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

public class UseService {
    private Userdao userdao = new Userdao();

    /**
     * 检查用户名和密码是否正确
     * @param logUser
     * @return
     * @throws UserException
     */
    public User checkNamePass(User logUser) throws UserException {
        User user = null;
        try {
            user = userdao.findbyName(logUser.getLoginname(), logUser.getLoginpass());
            if (user == null) throw new UserException("账号或密码错误");
            if(!user.isStatus())throw new UserException("账号未激活");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }


    public void regist(User user) {
        user.setUid(CommonUtils.uuid());
        user.setStatus(false);
        user.setActivationCode(CommonUtils.uuid() + CommonUtils.uuid());
        try {
            userdao.add(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Properties prop = new Properties();
        try {
            prop.load(this.getClass().getClassLoader().getResourceAsStream("email_regist.properties"));
        } catch (IOException e1) {
            throw new RuntimeException(e1);
        }
        String host = prop.getProperty("host");//服务器主机名
        String name = prop.getProperty("username");//登录名
        String pass = prop.getProperty("password");//登录密码
        Session session = MailUtils.createSession(host, name, pass);

        String from = prop.getProperty("from");
        String to = user.getEmail();
        String subject = prop.getProperty("subject");
        String content = MessageFormat.format(prop.getProperty("content"), user.getActivationCode());
        Mail mail = new Mail(from, to, subject, content);
        try {
            MailUtils.send(session, mail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void alterpassword(User user, User formUser) throws UserException {
        try {
            boolean bool = userdao.findByUidAndPass(user.getUid(), formUser.getLoginpass());
            if(!bool) {//如果老密码错误
                throw new UserException("旧密码错误！");
            }
            userdao.alterpassword(user.getUid(), formUser.getNewpass());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean ajxValidateloginname(String loginName){
        try {
            return userdao.ajxValidateloginname(loginName);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean ajxValidateemail(String email){
        try {
            return userdao.ajxemail(email);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 激活
     * @param code
     * @throws UserException
     */
    public void activate(String code) throws UserException {
        try {
            User user = userdao.findbycode(code);
            if(user == null) throw new UserException("无效的激活码！");
            if(user.isStatus()) throw new UserException("您已经激活过了！");
            userdao.updateStatus(user.getUid(), true);//修改状态
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询用户
     * @param uid
     * @return
     */
    public User findbyUid(String uid){
        try {
            return userdao.findbyUid(uid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
