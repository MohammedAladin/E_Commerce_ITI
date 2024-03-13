package iti.jets.business.entities;
import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "cartitem")
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cartItemId", nullable = false)
    private Integer id;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cartId")
    private Cart cart;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "productId")
    private Product product;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void incrementCartItem(int number){
        quantity+= number;
    }

    public void decrementCartItem(int number){
        quantity-=number;
    }

    public double getTotalPrice(){
        return product.getPrice().doubleValue() * quantity;
    }
}