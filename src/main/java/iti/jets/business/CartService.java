package iti.jets.business;

import iti.jets.business.entities.Cart;
import iti.jets.business.entities.CartItem;
import iti.jets.business.entities.Product;
import iti.jets.persistence.connection.JPAManager;
import iti.jets.persistence.repositories.CartRepo;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.Objects;

public class CartService {

    private final CartRepo cartRepo;
    public CartService(){
        EntityManager em = JPAManager.INSTANCE.getEntityManagerFactory().createEntityManager();
        cartRepo = new CartRepo(em);
    }

    public void addProductToCart(Product product, Cart cart, int quantity){
        if(quantity == 0)
            return;

        List<CartItem> cartItems = getCartItemsByCartId(cart.getId());

        //check if product is already exist in cart
        for (CartItem cartItem: cartItems){
            if (Objects.equals(cartItem.getProduct().getId(), product.getId())){
                incrementCartItem(cartItem,quantity);
                return;
            }
        }

        //create new Cart Item

        CartItem newCartItem = new CartItem();
        newCartItem.setProduct(product);
        newCartItem.setQuantity(quantity);

        cartRepo.addItemToCart(newCartItem, cart.getId());
    }

    public void deleteCartItem(int itemId){
        cartRepo.deleteCartItem(itemId);
    }

    public void incrementCartItem(CartItem cartItem, int quantity){
        cartItem.incrementCartItem(quantity);
        cartRepo.updateCartItem(cartItem);
    }

    public void decrementCartItem(CartItem cartItem, int quantity){
        cartItem.decrementCartItem(quantity);
        cartRepo.updateCartItem(cartItem);
    }

    public List<CartItem> getCartItemsByCartId(int cartId){
        return cartRepo.getCartItemsByCartId(cartId);
    }

    public List<CartItem> getCartItemsByCustomerId(int customerId){
        return cartRepo.getCartItemsByCustomerId(customerId);
    }
}
