package iti.jets.business.Dtos;

import iti.jets.business.entities.Category;

import java.math.BigDecimal;

public class ProductDtoYousif {

    private Integer id;


    private String productName;


    private String productDescription;


    private byte[] productImage;


    private BigDecimal price;


    private Integer stockCount;


    private Category category;


//    private Set<BuyedItem> buyedItems = new LinkedHashSet<>();
//
//
//    private Set<CartItem> cartItems = new LinkedHashSet<>();
//
//
//    private Set<ProductReview> productreviews = new LinkedHashSet<>();

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

//    public Set<BuyedItem> getBuyeditems() {
//        return buyedItems;
//    }
//
//    public void setBuyeditems(Set<BuyedItem> buyedItems) {
//        this.buyedItems = buyedItems;
//    }
//
//    public Set<CartItem> getCartitems() {
//        return cartItems;
//    }
//
//    public void setCartitems(Set<CartItem> cartItems) {
//        this.cartItems = cartItems;
//    }
//
//    public Set<ProductReview> getProductreviews() {
//        return productreviews;
//    }
//
//    public void setProductreviews(Set<ProductReview> productreviews) {
//        this.productreviews = productreviews;
//    }

}

