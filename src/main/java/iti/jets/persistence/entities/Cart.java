package iti.jets.persistence.entities;// default package
// Generated 4 Mar 2024, 00:40:35 by Hibernate Tools 6.0.2.Final


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Cart generated by hbm2java
 */
@Entity
@Table(name="cart"
    ,catalog="ecommercedb"
)
public class Cart  implements java.io.Serializable {


     private int cartId;
     private BigDecimal totalPrice;
     private Set<CartItem> cartItems = new HashSet<CartItem>(0);
     private Set<Customer> customers = new HashSet<Customer>(0);

    public Cart() {
    }

	
    public Cart(int cartId) {
        this.cartId = cartId;
    }
    public Cart(int cartId, BigDecimal totalPrice, Set<CartItem> cartItems, Set<Customer> customers) {
       this.cartId = cartId;
       this.totalPrice = totalPrice;
       this.cartItems = cartItems;
       this.customers = customers;
    }
   
     @Id 

    
    @Column(name="cart_id", unique=true, nullable=false)
    public int getCartId() {
        return this.cartId;
    }
    
    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    
    @Column(name="total_price", precision=10, scale=2)
    public BigDecimal getTotalPrice() {
        return this.totalPrice;
    }
    
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="cart")
    public Set<CartItem> getCartItems() {
        return this.cartItems;
    }
    
    public void setCartItems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="cart")
    public Set<Customer> getCustomers() {
        return this.customers;
    }
    
    public void setCustomers(Set<Customer> customers) {
        this.customers = customers;
    }




}


