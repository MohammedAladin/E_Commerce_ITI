package iti.jets.business.entities;

import jakarta.persistence.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "product")
public class Product implements Serializable {

    public Product(){

    }

    public Product(String productName, String productDescription, byte[] productImage, BigDecimal price, Integer stockCount, Category category, Set<BuyedItem> buyedItems, Set<CartItem> cartItems, Set<ProductReview> productreviews) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.productImage = productImage;
        this.price = price;
        this.stockCount = stockCount;
        this.category = category;
        this.buyedItems = buyedItems;
        this.cartItems = cartItems;
        this.productreviews = productreviews;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name='" + productName + '\'' + ", description='" + productDescription  + ", price=" + price + ", quantity=" + stockCount + '}';
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productId")
    private Integer id;

    @Column(name = "productName", nullable = false)
    private String productName;

    @Lob
    @Column(name = "productDescription", nullable = false)
    private String productDescription;

    @Column(name = "productImage")
    private byte[] productImage;

    @Column(name = "price", precision = 10, scale = 2, nullable = false)
    private BigDecimal price;

    @Column(name = "stockCount", nullable = false)
    private Integer stockCount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "categoryId")
    private Category category;

    @OneToMany(mappedBy = "product")
    private Set<BuyedItem> buyedItems = new LinkedHashSet<>();

    @OneToMany(mappedBy = "product")
    private Set<CartItem> cartItems = new LinkedHashSet<>();

    @OneToMany(mappedBy = "product")
    private Set<ProductReview> productreviews = new LinkedHashSet<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public byte[] getProductImage() {
        return productImage;
    }

    public void setProductImage(byte[] productImage) {
        this.productImage = productImage;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStockCount() {
        return stockCount;
    }

    public void setStockCount(Integer stockCount) {
        this.stockCount = stockCount;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void decrementQuantity(int number){
        stockCount-=number;
    }

    public Set<BuyedItem> getBuyeditems() {
        return buyedItems;
    }

    public void setBuyeditems(Set<BuyedItem> buyedItems) {
        this.buyedItems = buyedItems;
    }

    public Set<CartItem> getCartitems() {
        return cartItems;
    }

    public void setCartitems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public Set<ProductReview> getProductreviews() {
        return productreviews;
    }

    public void setProductreviews(Set<ProductReview> productreviews) {
        this.productreviews = productreviews;
    }

}