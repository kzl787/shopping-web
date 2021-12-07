package jk2.javawebcode.category.service;

import jk2.javawebcode.category.dao.CategoryDao;
import jk2.javawebcode.category.domain.Category;

import java.sql.SQLException;
import java.util.List;

public class CategoryService {
    private CategoryDao categoryDao = new CategoryDao();

    /**
     * 查找所有分类模块功能
     * @return
     */
    public List<Category> findall(){
        try {
            return categoryDao.findall();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询所有一级分类
     * @return
     */
    public List<Category> findParent(){
        try {
            return categoryDao.findParent();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询某个一级分类下的子分类
     * @param pid
     * @return
     */
    public List<Category> findChid(String pid){
        try {
            return categoryDao.chilList(pid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
