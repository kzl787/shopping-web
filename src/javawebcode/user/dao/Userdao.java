package jk2.javawebcode.user.dao;

import cn.itcast.jdbc.TxQueryRunner;
import jk2.javawebcode.user.domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import java.sql.SQLException;

public class Userdao {
    private QueryRunner que = new TxQueryRunner();

    /**
     * 修改密码
     * @param uid
     * @param reloginpass
     * @throws SQLException
     */
    public void alterpassword(String uid, String reloginpass) throws SQLException {
        String sql = "update t_user set loginpass=? where uid=?";
        que.update(sql, reloginpass, uid);
    }

    public boolean findByUidAndPass(String uid, String pass) throws SQLException {
        String sql = "select count(*) from t_user where uid=? and loginpass=?";
        Number num = (Number) que.query(sql, new ScalarHandler(), uid, pass);
        return num.intValue() > 0 ;
    }
    /**
     * 根据用户名和密码查找用户
     * @param loginname
     * @param loginpass
     * @return User
     * @throws SQLException
     */
    public User findbyName(String loginname, String loginpass) throws SQLException {
        String sql = "select * from t_user where loginname=? and loginpass=?";
        return  que.query(sql, new BeanHandler<User>(User.class), loginname, loginpass);
    }
    /**
     * 用户名校验
     * @param loginname
     * @return
     * @throws SQLException
     */
    public boolean ajxValidateloginname(String loginname) throws SQLException {
        String sql = "select count(*) from t_user where loginname=?";
        Number number = (Number) que.query(sql, new ScalarHandler(), loginname);
        return number.intValue() == 0;
    }

    /**
     * 邮件校验
     * @param email
     * @return
     * @throws SQLException
     */
    public boolean ajxemail(String email) throws SQLException {
        String sql = "select count(*) from t_user where email=?";
        Number number = (Number) que.query(sql, new ScalarHandler(), email);
        return number.intValue() == 0;
    }

    /**
     * 添加用户
     * @param use
     * @throws SQLException
     */
    public void add(User use) throws SQLException {
        String sql = "insert into t_user values(?, ?, ?, ?, ?, ?)";
        Object[] params = {use.getUid(), use.getLoginname(), use.getLoginpass(), use.getEmail(), use.isStatus(),use.getActivationCode()};
        que.update(sql, params);
    }

    /**
     * （注册功能的实现）通过激活码找到该用户信息
     * @param code
     * @return
     * @throws SQLException
     */
    public User findbycode(String code) throws SQLException {
        String sql = "select * from t_user where activationCode=?";
        return que.query(sql, new BeanHandler<User>(User.class), code);
    }

    /**
     * 改变用户激活状态
     * @param uid
     * @param statu
     * @throws SQLException
     */
    public void updateStatus(String uid, boolean statu) throws SQLException {
        String sql = "update t_user set status=? where uid=?";
        que.update(sql,statu, uid);
    }

    /**
     * 查找用户
     * @param uid
     * @return
     * @throws SQLException
     */
    public User findbyUid(String uid) throws SQLException {
        String sql = "select * from t_user where uid=?";
        User user = que.query(sql, new BeanHandler<User>(User.class), uid);
        return user;
    }
}
