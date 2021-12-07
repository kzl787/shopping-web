package jk2.javawebcode.category.dao;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;
import jk2.javawebcode.category.domain.Category;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CategoryDao {
    private QueryRunner que = new TxQueryRunner();
    /**
     * 找到所有分类，返回的是一级分类列表
     * @return
     */
    public List<Category> findall() throws SQLException {
        String sql = "select * from t_category where pid is null";
        List<Category> parentlist = que.query(sql, new BeanListHandler<Category>(Category.class));
        //为每个一级分类设置子分类List
        for (Category parent: parentlist){
            String uid = parent.getCid();
            parent.setChil(chilList(uid));
        }
        return parentlist;
    }

    /**
     * 查询所有一级分类
     * @return
     * @throws SQLException
     */
    public List<Category> findParent() throws SQLException {
        String sql = "select * from t_category where pid is null";
        List<Category> parentlist = que.query(sql, new BeanListHandler<Category>(Category.class));
        return parentlist;
    }
    /**
     * 将Map映射成Category类
     * @param cateMap
     * @return
     */
    private Category toCategory(Map<String, Object> cateMap){
        Category category = CommonUtils.toBean(cateMap, Category.class);
        String pid = (String) cateMap.get("pid");
        if(pid != null){
            Category parent = new Category();
            parent.setCid(pid);
            category.setParent(parent);
        }
        return category;
    }

    /**
     * 将Maplist映射成List<Category>
     * @param mapList
     * @return
     */
    private List<Category> toCategoryList(List<Map<String, Object>> mapList){
        List<Category> categoryList = new ArrayList<Category>();
        for (Map<String, Object> cateMap: mapList){
            Category category = toCategory(cateMap);
            categoryList.add(category);
        }
        return categoryList;
    }

    /**
     * 查询某个一级分类下的子分类
     * @param pid
     * @return
     * @throws SQLException
     */
    public List<Category> chilList(String pid) throws SQLException {
        String sql = "select * from t_category where pid=?";
        List<Map<String, Object>> maplist = que.query(sql, new MapListHandler(), pid);
        return toCategoryList(maplist);
    }
}
