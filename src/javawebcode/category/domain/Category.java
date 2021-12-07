package jk2.javawebcode.category.domain;

import java.util.List;

public class Category {
    private String cid;
    private String cname;
    private Category parent;
    private String desc;
    private List<Category> chil;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public List<Category> getChil() {
        return chil;
    }

    public void setChil(List<Category> chil) {
        this.chil = chil;
    }

    @Override
    public String toString() {
        return "Category{" +
                "cid='" + cid + '\'' +
                ", cname='" + cname + '\'' +
                ", parent=" + parent +
                ", desc='" + desc + '\'' +
                ", chil=" + chil +
                '}';
    }
}
