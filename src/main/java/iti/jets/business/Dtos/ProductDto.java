package iti.jets.business.Dtos;

import iti.jets.business.entities.Category;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Arrays;

public class ProductDto implements Serializable {
    private Integer id;
    private String productName;
    private String productDescription;
    private Integer stockCount;
//    private byte[] productImage;
    private BigDecimal price;
    private CategoryDto category;

    public ProductDto() {
    }

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

//    public byte[] getProductImage() {
//        return productImage;
//    }
//
//    public void setProductImage(byte[] productImage) {
//        this.productImage = productImage;
//    }


    public CategoryDto getCategory() {
        return category;
    }

    public void setCategory(CategoryDto category) {
        this.category = category;
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

    @Override
    public String toString() {
        return "ProductDto{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", stockCount=" + stockCount +
//                ", productImage=" + Arrays.toString(productImage) +
                ", price=" + price +
                '}';
    }
}
