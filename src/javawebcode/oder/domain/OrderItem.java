package jk2.javawebcode.oder.domain;

import jk2.javawebcode.book.damain.Book;


public class OrderItem {
    private String orederItemId;
    private int quantity;
    private double subtotal;
    private Book book;
    private String bname;
    private double currPrice;
    private String image_b;
    private Order order;

    @Override
    public String toString() {
        return "OrderItem{" +
                "orederItemId='" + orederItemId + '\'' +
                ", quantity=" + quantity +
                ", subtotal=" + subtotal +
                ", book=" + book +
                ", bname='" + bname + '\'' +
                ", currPrice=" + currPrice +
                ", image_b='" + image_b + '\'' +
                ", order=" + order +
                '}';
    }

    public String getOrederItemId() {
        return orederItemId;
    }

    public void setOrederItemId(String orederItemId) {
        this.orederItemId = orederItemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public double getCurrPrice() {
        return currPrice;
    }

    public void setCurrPrice(double currPrice) {
        this.currPrice = currPrice;
    }

    public String getImage_b() {
        return image_b;
    }

    public void setImage_b(String image_b) {
        this.image_b = image_b;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
