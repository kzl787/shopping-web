package jk2.javawebcode.oder.domain;

import jk2.javawebcode.user.domain.User;

import java.util.List;

public class Order {
    private String oid;
    private List<OrderItem> orderItemList;
    private User user;
    private String ordertime;
    private double total;
    private int status;
    private String address;

    @Override
    public String toString() {
        return "Order{" +
                "oid='" + oid + '\'' +
                ", orderItemList=" + orderItemList +
                ", user=" + user +
                ", ordertime='" + ordertime + '\'' +
                ", total=" + total +
                ", status=" + status +
                ", address='" + address + '\'' +
                '}';
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
