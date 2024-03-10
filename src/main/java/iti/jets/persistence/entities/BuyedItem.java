package iti.jets.persistence.entities;// default package
// Generated 4 Mar 2024, 00:40:35 by Hibernate Tools 6.0.2.Final


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

/**
 * BuyedItem generated by hbm2java
 */
@Entity
@Table(name="buyed_item"
    ,catalog="ecommercedb"
)
public class BuyedItem  implements java.io.Serializable {


     private int buyedItemId;
     private Product product;
     private CustomerOrder customerOrder;
     private Integer quantity;
     private Integer totalPrice;

    public BuyedItem() {
    }

	
    public BuyedItem(int buyedItemId) {
        this.buyedItemId = buyedItemId;
    }
    public BuyedItem(int buyedItemId, Product product, CustomerOrder customerOrder, Integer quantity, Integer totalPrice) {
       this.buyedItemId = buyedItemId;
       this.product = product;
       this.customerOrder = customerOrder;
       this.quantity = quantity;
       this.totalPrice = totalPrice;
    }
   
     @Id 

    
    @Column(name="buyed_item_id", unique=true, nullable=false)
    public int getBuyedItemId() {
        return this.buyedItemId;
    }
    
    public void setBuyedItemId(int buyedItemId) {
        this.buyedItemId = buyedItemId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="product_id")
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="order_id")
    public CustomerOrder getCustomerOrder() {
        return this.customerOrder;
    }
    
    public void setCustomerOrder(CustomerOrder customerOrder) {
        this.customerOrder = customerOrder;
    }

    
    @Column(name="quantity")
    public Integer getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    
    @Column(name="total_price")
    public Integer getTotalPrice() {
        return this.totalPrice;
    }
    
    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }




}


