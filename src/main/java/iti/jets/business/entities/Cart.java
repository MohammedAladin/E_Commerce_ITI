package iti.jets.business.entities;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "cart")
public class Cart implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cartId")
    private Integer id;

    @OneToMany(mappedBy = "cart")
    private Set<CartItem> cartItems = new LinkedHashSet<>();

    @OneToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Set<CartItem> getCartitems() {
        return cartItems;
    }

    public void setCartitems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public void addCartItem(CartItem cartItem) {
        cartItems.add(cartItem);
    }

    public void clearCart() {
        cartItems.clear();
    }

    public double getTotalPrice(){
        double result = 0.0;

        for (CartItem item: cartItems){
            result += (item.getProduct().getPrice().doubleValue() * item.getQuantity());
        }

        return result;
    }
}