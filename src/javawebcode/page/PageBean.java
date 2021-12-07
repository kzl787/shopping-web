package jk2.javawebcode.page;

import java.util.List;

public class PageBean<T> {
    private int totalRecord;
    private int pageRecord;
    private List<T> beanList;
    private  String url;
    private int curPage;
    private int totalPage;

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getPageRecord() {
        return pageRecord;
    }

    public void setPageRecord(int pageRecord) {
        this.pageRecord = pageRecord;
    }

    public List<T> getBeanList() {
        return beanList;
    }

    public void setBeanList(List<T> beanList) {
        this.beanList = beanList;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
