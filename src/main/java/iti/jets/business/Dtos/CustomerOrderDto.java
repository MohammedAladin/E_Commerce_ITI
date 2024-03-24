package iti.jets.business.Dtos;

import java.time.LocalDate;

public class CustomerOrderDto {
    private Integer id;
    private double totalPrice;
    private String date;
    private String orderStatus;

    private String customerName;

    private Integer customerId;

    public CustomerOrderDto() {
    }

    public CustomerOrderDto(Integer id, double totalPrice, String date, String orderStatus, String customerName, Integer customerId) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.date = date;
        this.orderStatus = orderStatus;
        this.customerName = customerName;
        this.customerId = customerId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }
}
