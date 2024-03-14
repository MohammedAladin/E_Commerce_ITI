package iti.jets.business.Dtos;

import iti.jets.business.entities.*;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

public class CustomerDto {

    private Integer id;
    private String customerName;

    private byte[] customerImage;

    private String phoneNumber;

    private String email;

    private String password;

    private BigDecimal creditLimit;

    private LocalDate dob;

    private Cart cart;

    private CreditCard billingCreditCard;

    private Set<CustomerOrder> customerOrders = new LinkedHashSet<>();

    private Set<OrderHistory> orderhistories = new LinkedHashSet<>();

    private Set<ProductReview> productreviews = new LinkedHashSet<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public byte[] getCustomerImage() {
        return customerImage;
    }

    public void setCustomerImage(byte[] customerImage) {
        this.customerImage = customerImage;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public BigDecimal getCreditLimit() {
        return creditLimit;
    }

    public void setCreditLimit(BigDecimal creditLimit) {
        this.creditLimit = creditLimit;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public CreditCard getBillingCreditCard() {
        return billingCreditCard;
    }

    public void setBillingCreditCard(CreditCard billingCreditCard) {
        this.billingCreditCard = billingCreditCard;
    }

    public Set<CustomerOrder> getCustomerOrders() {
        return customerOrders;
    }

    public void setCustomerOrders(Set<CustomerOrder> customerOrders) {
        this.customerOrders = customerOrders;
    }

    public Set<OrderHistory> getOrderhistories() {
        return orderhistories;
    }

    public void setOrderhistories(Set<OrderHistory> orderhistories) {
        this.orderhistories = orderhistories;
    }

    public Set<ProductReview> getProductreviews() {
        return productreviews;
    }

    public void setProductreviews(Set<ProductReview> productreviews) {
        this.productreviews = productreviews;
    }
}
