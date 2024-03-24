package iti.jets.business.entities;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;


@Entity
@Table(name = "customer")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customerId")
    private Integer id;
    @Column(name = "customerName", nullable = false)
    private String customerName;

    @Column(name = "customerImage")
    private byte[] customerImage;

    @Column(name = "phoneNumber", length = 15)
    private String phoneNumber;

    @Column(name = "email", length = 50, nullable = false)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "creditLimit", precision = 10, scale = 2, nullable = false)
    private Double creditLimit;

    @Column(name = "DOB")
    private LocalDate dob;

    @OneToOne(mappedBy = "customer")
    @JsonManagedReference

    private Cart cart;

    @OneToOne(mappedBy = "customer")
    private CreditCard billingCreditCard;

    @OneToMany(mappedBy = "customer")
    @JsonManagedReference

    private Set<CustomerOrder> customerOrders = new LinkedHashSet<>();

    @OneToMany(mappedBy = "customer")
    private Set<OrderHistory> orderhistories = new LinkedHashSet<>();

    @OneToMany(mappedBy = "customer")
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

    public Double getCreditLimit() {
        return creditLimit;
    }

    public void setCreditLimit(Double creditLimit) {
        this.creditLimit = creditLimit;
    }
    public void updateCreditLimit(Double amount){
        this.creditLimit -= amount;
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

    public Set<CustomerOrder> getCustomerorders() {
        return customerOrders;
    }

    public void setCustomerorders(Set<CustomerOrder> customerOrders) {
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


    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", customerName='" + customerName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}