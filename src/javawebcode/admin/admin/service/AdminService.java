package jk2.javawebcode.admin.admin.service;

import jk2.javawebcode.admin.admin.dao.AdminDao;
import jk2.javawebcode.admin.admin.domain.Admin;

import java.sql.SQLException;

public class AdminService {
    private AdminDao adminDao = new AdminDao();

    /**
     * 登录
     * @param admin
     * @return
     */
    public Admin login(Admin admin){
        try {
            return adminDao.findbyNameAndPwd(admin);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
