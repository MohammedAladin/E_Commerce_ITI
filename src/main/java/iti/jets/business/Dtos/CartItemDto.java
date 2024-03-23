package iti.jets.business.Dtos;

import iti.jets.business.entities.Cart;
import iti.jets.business.entities.Product;

import java.io.Serializable;

public class CartItemDto implements Serializable {

    private Integer id;
    private Integer quantity;
    private CartDto cart;

    private ProductDto product;

    public CartItemDto() {
    }

    public CartItemDto(Integer id, Integer quantity, ProductDto product) {
        this.id = id;
        this.quantity = quantity;
        this.product = product;
    }

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

    public CartDto getCart() {
        return cart;
    }

    public void setCart(CartDto cart) {
        this.cart = cart;
    }

    public ProductDto getProduct() {
        return product;
    }

    public void setProduct(ProductDto product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "CartItemDto{" +
                "id=" + id +
                ", quantity=" + quantity +
                ", product=" + product +
                '}';
    }
}
