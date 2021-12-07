package jk2.javawebcode.admin.admin.dao;

import cn.itcast.jdbc.TxQueryRunner;
import jk2.javawebcode.admin.admin.domain.Admin;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class AdminDao {
    private QueryRunner que = new TxQueryRunner();

    /**.
     * 通过用户名和密码查询用户
     * @param admin
     * @return
     * @throws SQLException
     */
    public Admin findbyNameAndPwd(Admin admin) throws SQLException {
        String sql = "select * from t_admin where adminName=? and adminPwd=?";
        return que.query(sql, new BeanHandler<Admin>(Admin.class), admin.getAdminName(), admin.getAdminPwd());
    }
}
