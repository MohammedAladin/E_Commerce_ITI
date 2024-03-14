package iti.jets.business.entities;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "creditcard")
public class CreditCard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "creditCardId")
    private Integer id;

    @Column(name = "cardNumber", length = 16, nullable = false)
    private String cardNumber;

    @Column(name = "cvv", nullable = false)
    private Integer cvv;

    @Column(name = "exp_date", nullable = false)
    private LocalDate expDate;

    @OneToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    public Customer getCustomers() {
        return customer;
    }

    public void setCustomers(Customer customer) {
        this.customer = customer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Integer getCvv() {
        return cvv;
    }

    public void setCvv(Integer cvv) {
        this.cvv = cvv;
    }

    public LocalDate getExpDate() {
        return expDate;
    }

    public void setExpDate(LocalDate expDate) {
        this.expDate = expDate;
    }

}