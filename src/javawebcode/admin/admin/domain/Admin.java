package jk2.javawebcode.admin.admin.domain;

public class Admin {
    private String adminName;
    private String adminId;
    private String adminPwd;

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminName='" + adminName + '\'' +
                ", adminId='" + adminId + '\'' +
                ", adminPws='" + adminPwd + '\'' +
                '}';
    }
}
